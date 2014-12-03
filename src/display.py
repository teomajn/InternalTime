import numpy as np
from bokeh.plotting import *
from bokeh.objects import Glyph, DataRange1d
from bokeh.transforms import line_downsample
import redis
import sys
import argparse
import threading
import socket
import time
import datetime
import uuid
sys.path.append("/Users/john/Development/CNMAT/CNMAT/libo")
import libo as o

def make_colors():
    clist = ["#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#FF00FF", "#00FFFF", "#000000"]
    i = 0
    while True:
        yield clist[i]
        i = (i + 1) % len(clist)

UDP_IP = "127.0.0.1"
data_port = 5005
plots = []
markers = []
dirty = False
data_thread = None
data_thread_continue = False
update_thread = None
update_thread_continue = False
colors = make_colors()

class Plot:
    global plots, colors
    x_axis_label = ""
    y_axis_label = ""
    plot = None
    data_source = None
    display_window_x = []
    display_window_y = []
    display_window_sec = 20
    show_all = 0
    show_window = 1
    show = show_window
    all_data_x = []
    all_data_y = []
    active = False
    def __init__(self, xaddress, yaddress, color = None, f = line, display_window_sec = 5):
        self.xaddress = xaddress
        self.yaddress = yaddress
        self.display_window_sec = display_window_sec
        if color == None:
            self.color = colors.next()
        else:
            self.color = color
        self.plot = f([], [], color = self.color, tools="box_zoom,pan,previewsave,reset,resize,wheel_zoom,select,crosshair")
        self.data_source = self.plot.renderers[-1].data_source
        plots.append(self)

    def add_data(self, x, y):
        self.all_data_x.append(x)
        self.all_data_y.append(y)
        if self.display_window_x >= 0:
            mintime = x - self.display_window_sec

            tmpxar = []
            tmpyar = []
            for xx, yy in zip(self.display_window_x, self.display_window_y):
                if xx >= mintime and xx <= x:
                    tmpxar.append(xx)
                    tmpyar.append(yy)
            tmpxar.append(x)
            tmpyar.append(y)
            self.display_window_x = tmpxar
            self.display_window_y = tmpyar
    
    def update(self, cs):
        if self.show == self.show_all:
            self.data_source.data["x"] = self.all_data_x
            self.data_source.data["y"] = self.all_data_y
	elif self.show == self.show_window:
            self.data_source.data["x"] = self.display_window_x
            self.data_source.data["y"] = self.display_window_y
        cs.store_objects(self.data_source)
        
    def showall(self):
        self.show = self.show_all

    def showwindow(self):
        self.show = self.show_window
        

class Marker:
    global markers
    def __init__(self, x1address, y1address, x2address, y2address, textaddress = None, color = "#000000"):
        self.x1address = x1address
        self.x2address = x2address
        self.y1address = y1address
        self.y2address = y2address
        self.textaddress = textaddress
        self.color = color
        self.plot = multi_line([], [], color = self.color)
        self.data_source = self.plot.renderers[-1].data_source
        markers.append(self)

def new_figure(title = "", xlabel = "", ylabel = "", width = 1000, height = 300):
    global colors
    colors = make_colors()
    figure(title = title,
           x_axis_label = xlabel,
           y_axis_label = ylabel,
           plot_width = width,
           plot_height = height)
    hold()

def update_plot():
    global dirty, plots, update_thread, update_thread_continue
    while True:
        with threading.Lock():
            if dirty == True:
            	dirty = False
            	s = cursession()
            	for plot in plots:
                    cursession().store_objects(plot.data_source)
                    #cs = cursession()
                    #plot.update(cs)
            	for marker in markers:
                    cursession().store_objects(marker.data_source)
            if update_thread_continue == False:
            	return
        time.sleep(0.1)

def udp_receive_data(port):
    global dirty, plots, data_thread, data_thread_continue
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.settimeout(1.0)
    sock.bind((UDP_IP, port))
    shoulddirty = False
    while True:
    	try:
            data, addr = sock.recvfrom(8192)
        except socket.timeout:
            with threading.Lock():
                if data_thread_continue == False:
                    sock.close()
                    return
                else:
                    continue
        bndl_u = o.osc_bundle_s_deserialize_r(len(data), data)
        for plot in plots:
            if plot.active == True:
		xaddy = plot.xaddress
            	yaddy = plot.yaddress
            	ds = plot.data_source
            	xval = get_float_for_address(xaddy, bndl_u)
            	yval = get_float_for_address(yaddy, bndl_u)
            	if(xval != None and yval != None):
                    with threading.Lock():
                    	ds.data["x"].append(xval)
                    	ds.data["y"].append(yval)
                        #plot.add_data(xval, yval)
                        shoulddirty = True
        for marker in markers:
            x1addy = marker.x1address
            x2addy = marker.x2address
            y1addy = marker.y1address
            y2addy = marker.y2address
            textaddy = marker.textaddress
            x1val = get_float_for_address(x1addy, bndl_u)
            x2val = get_float_for_address(x2addy, bndl_u)
            y1val = get_float_for_address(y1addy, bndl_u)
            y2val = get_float_for_address(y2addy, bndl_u)
            # if y1val == None:
            #     y1val = 0
            # if y2val == None:
            #     y2val = 1
            if textaddy != None:
            	text = get_string_for_address(textaddy, bndl_u)
            ds = marker.data_source
            if x1val != None and x2val != None and y1val != None and y2val != None:
                with threading.Lock():
                    ds.data["xs"].append([x1val, x2val])
                    ds.data["ys"].append([y1val, y2val])
                    shoulddirty = True
        if shoulddirty == True:
            dirty = True
        o.osc_bundle_u_free(bndl_u)
        with threading.Lock():
            if data_thread_continue == False:
                sock.close()
		return

def get_float_for_address(address, bndl_u):
    global dirty
    msgs = o.osc_bundle_u_lookupAddress_r(bndl_u, address, 1)
    if o.osc_array_getLen(msgs) > 0:
        msg = o.osc_array_get(msgs, 0)
        for i in range(0, o.osc_message_u_getArgCount(o.void_to_osc_message_u(msg))):
            atom = o.osc_message_u_getArg_r(o.void_to_osc_message_u(msg), i)
            f = o.osc_atom_u_getFloat(atom)
            o.osc_array_free(msgs)
            return f
    o.osc_array_free(msgs)
    return None

def get_string_for_address(address, bndl_u):
    global dirty
    msgs = o.osc_bundle_u_lookupAddress_r(bndl_u, address, 1)
    if o.osc_array_getLen(msgs) > 0:
        msg = o.osc_array_get(msgs, 0)
        for i in range(0, o.osc_message_u_getArgCount(o.void_to_osc_message_u(msg))):
            atom = o.osc_message_u_getArg_r(o.void_to_osc_message_u(msg), i)
            txt = o.osc_atom_u_getStringPtr(atom)
            o.osc_array_free(msgs)
            return txt
    o.osc_array_free(msgs)
    return None

def clear():
    global plots, markers, dirty
    with threading.Lock():
    	for plot in plots:
            plot.data_source.data["x"] = []
            plot.data_source.data["y"] = []
    	for marker in markers:
            marker.data_source.data["xs"] = []
            marker.data_source.data["ys"] = []
        dirty = True

def plot_ecg(run = True, make_new_figure = True, prefixes = ["/0"]):
    for pfx in prefixes:
        if make_new_figure == True:
            new_figure("ECG")
    	Plot(pfx + "/time/relative", pfx + "/delayed/ecg/raw")
    	Plot(pfx + "/time/relative", pfx + "/delayed/ecg/bpf")
    	Plot(pfx + "/time/relative", pfx + "/ecg/mwi")
	Plot(pfx + "/peak/QRS/time/relative", pfx + "/peak/QRS/val", f = cross, color = "#0000FF")
    	Plot(pfx + "/time/relative", pfx + "/I1", color = "#FF0000")
    	Plot(pfx + "/time/relative", pfx + "/I2", color = "#00FF00")
    	Plot(pfx + "/time/relative", pfx + "/F1", color = "#00FFFF")
    	Plot(pfx + "/time/relative", pfx + "/F2", color = "#FFFF00")
	#Marker(pfx + "/peak/hist/delayed/ecg/bpf/time/relative", pfx + "/peak/hist/delayed/ecg/bpf/val", pfx + "/peak/hist/ecg/mwi/time/relative", pfx + "/peak/hist/ecg/mwi/val")
    	if run == True:
            allon()

def plot_heartrate_rr(run = True, make_new_figure = True, prefixes = ["/0"]):
    for pfx in prefixes:
    	if make_new_figure == True:
            new_figure("Heartrate (RR)")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/RR")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/avg/RR/1")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/avg/RR/2")
    	if run == True:
            allon()

def plot_heartrate_bpm(run = True, make_new_figure = True, prefixes = ["/0"]):
    for pfx in prefixes:
    	if make_new_figure == True:
            new_figure("Heartrate (BPM)")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/BPM", f = cross, color = "#FF0000")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/avg/BPM/1", f = cross, color = "#00FF00")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/avg/BPM/2", f = cross, color = "#0000FF")
    	Plot(pfx + "/time/relative", pfx + "/heart/rate/value/bpm", f = cross, color = "#00FFFF")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/BPM", color = "#FF0000")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/avg/BPM/1", color = "#00FF00")
    	Plot(pfx + "/peak/QRS/time/relative", pfx + "/avg/BPM/2", color = "#0000FF")
    	Plot(pfx + "/time/relative", pfx + "/heart/rate/value/bpm", color = "#00FFFF")
    	if run == True:
            allon()

def plot_network(run = True, make_new_figure = True, prefixes = ["/0"]):
    for pfx in prefixes:
    	if make_new_figure == True:
            new_figure("Network")
    	Plot(pfx + "/time/relative", pfx + "/time/network/delta")
    	Plot(pfx + "/time/relative", pfx + "/time/delta")
    	if(run == True):
            allon()

def plot_all(run = True, prefixes = ["/0"]):
    for pfx in prefixes:
	plot_ecg(run = False, prefixes = [pfx])
    	plot_heartrate_bpm(run = False, prefixes = [pfx])
        Marker(pfx + "/time/relative", pfx + "/trigger/BPM", pfx + "/time/relative", pfx + "/null/0")
        # new_figure("Respiration")
        # Plot(pfx + "/time/relative", pfx + "/delayed/respiration/biopac/raw")
        # Marker(pfx + "/time/relative", pfx + "/trigger/respiration", pfx + "/time/relative", pfx + "/null/0")
        new_figure("Lead Off")
        Plot(pfx + "/time/relative", pfx + "/ecg/leadoff/leftarm")
        Plot(pfx + "/time/relative", pfx + "/ecg/leadoff/rightarm")
        plot_network(run = False, prefixes = [pfx])
    if(run == True):
        allon()

def plot_features(run = True, prefixes = ["/0"]):
    plot_ecg(run = False, prefixes = prefixes)
    for pfx in prefixes:
    	#Plot(pfx + "/time/relative", pfx + "/feature/mwi/raw", color = "#00FF00", f = x)
        #Plot(pfx + "/time/relative", pfx + "/slope/ecg/bpf/delayed", color = "#FF00FF")
    	Plot(pfx + "/time/relative", pfx + "/feature/mwi/d", color = "#0000FF", f = x)
    	Plot(pfx + "/time/relative", pfx + "/feature/bpf/raw", color = "#FF0000", f = x)
    	Plot(pfx + "/feature/both/time", pfx + "/feature/both/val", color = "#FF0000", f = circle_x)
    if(run == True):
        allon()

def plot_model(run = True, prefixes = ["/0"]):
    plot_ecg(run = False, prefixes = prefixes)
    plot_heartrate_bpm(run = False, prefixes = prefixes)
    for pfx in prefixes:
        Plot(pfx + "/model/x", pfx + "/model/y", color = "#000000")
    if(run == True):
        allon()

def allon():
    for plot in plots:
        plot.active = True

def alloff():
    for plot in plots:
        plot.active = False

def showall(plots = plots):
    global dirty
    with threading.Lock():
    	for plot in plots:
            plot.showall()
        dirty = True

def showwindow(plots = plots):
    global dirty
    with threading.Lock():
    	for plot in plots:
            plot.showwindow()
        dirty = True

def start_data_thread():
    global data_thread_continue, data_thread
    try:
        data_thread_continue = True
        data_thread = threading.Thread(target=udp_receive_data, args=[data_port])
        data_thread.start()
    except:
    	print "Error: couldn't start data thread"
        sys.exit(2)

def start_update_thread():
    global update_thread_continue, update_thread
    try:
        update_thread_continue = True
        update_thread = threading.Thread(target=update_plot)
        update_thread.start()
    except:
    	print "Error: couldn't start update thread"
        sys.exit(2)

def start_threads():
    start_data_thread()
    start_update_thread()

def stop_data_thread():
    global data_thread_continue, data_thread
    data_thread_continue = False
    print "stopping data thread"
    if data_thread != None:
    	data_thread.join()
    print "done"

def stop_update_thread():
    global update_thread_continue, update_thread
    update_thread_continue = False
    print "stopping update thread"
    if update_thread != None:
    	update_thread.join()
    print "done"

def stop_threads():
    stop_data_thread()
    stop_update_thread()

def start():
    start_threads()

def stop():
    stop_threads()

def main(argv):
    global data_port, plot_name, plots, data_thread, update_thread

    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "--name", help="set the name of the plot", default=datetime.datetime.fromtimestamp(time.time()).strftime('%Y%m%d-%H:%M:%S'))
    parser.add_argument("-d", "--data_port", help="set the port for sending data", type=int, default=data_port)

    args = parser.parse_args()

    data_port = args.data_port

    d = vars(args)
    output_server(d["name"])
    start_threads()
        
if __name__ == "__main__":
    main(sys.argv[1:])
