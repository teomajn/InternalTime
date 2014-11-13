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
update_thread = None
colors = make_colors()

class Plot:
    global plots, colors
    x_axis_label = ""
    y_axis_label = ""
    plot = None
    data_source = None
    active = False
    def __init__(self, xaddress, yaddress, color = None, f = line):
        self.xaddress = xaddress
        self.yaddress = yaddress
        if color == None:
            self.color = colors.next()
        else:
            self.color = color
        self.plot = f([], [], color = self.color, tools="box_zoom,pan,previewsave,reset,resize,wheel_zoom,select,crosshair")
        self.data_source = self.plot.renderers[-1].data_source
        plots.append(self)

class Marker:
    global markers
    def __init__(self, xaddress, yminaddress, ymaxaddress, textaddress, color = "#000000"):
        self.xaddress = xaddress
        self.yminaddress = yminaddress
        self.ymaxaddress = ymaxaddress
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
    global dirty, plots
    while True:
        with threading.Lock():
            if dirty == True:
                print "updating plot"
            	s = cursession()
            	for plot in plots:
                    cursession().store_objects(plot.data_source)
            	for marker in markers:
                    cursession().store_objects(marker.data_source)
            	dirty = False
        	print "done"
        time.sleep(0.1)

def udp_receive_data(port):
    global dirty, plots
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((UDP_IP, port))
    shoulddirty = False
    while True:
    	data, addr = sock.recvfrom(8192)
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
                    	shoulddirty = True
        for marker in markers:
            xaddy = marker.xaddress
            yminaddy = marker.yminaddress
            ymaxaddy = marker.ymaxaddress
            textaddy = marker.textaddress
            xval = get_float_for_address(xaddy, bndl_u)
            yminval = get_float_for_address(yminaddy, bndl_u)
            ymaxval = get_float_for_address(ymaxaddy, bndl_u)
            if yminval == None:
                yminval = 0
            if ymaxval == None:
                ymaxval = 1
            text = get_string_for_address(textaddy, bndl_u)
            ds = marker.data_source
            if(xval != None and text != None):
                with threading.Lock():
                    ds.data["xs"].append([xval, xval])
                    ds.data["ys"].append([yminval, ymaxval])
                    shoulddirty = True
        if shoulddirty == True:
            dirty = True
        o.osc_bundle_u_free(bndl_u)

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

def plot_ecg(run = True, make_new_figure = True):
    if make_new_figure == True:
    	new_figure("ECG")
    Plot("/time/relative", "/y0/stream/ecg/bpf/delayed", color = "#FF0000")
    Plot("/time/relative", "/y0/stream/ecg/mwi", color = "#00FF00")
    Plot("/time/relative", "/y0/stream/d/ecg/mwi", color = "#0000FF")
    #Plot("/time/relative", "/peak/QRS/bool", color = "#00FF00")
    Plot("/time/relative", "/I1", color = "#00FFFF")
    Plot("/time/relative", "/I2", color = "#00FFFF")
    Plot("/time/relative", "/F1", color = "#0000FF")
    Plot("/time/relative", "/F2", color = "#0000FF")
    Plot("/time/relative", "/r", color = "#000000", f = x)
    Plot("/time/relative", "/lower", color = "#000000")
    Plot("/time/relative", "/upper", color = "#000000")
    if run == True:
        allon()

def plot_heartrate_rr(run = True, make_new_figure = True):
    if make_new_figure == True:
    	new_figure("Heartrate (RR)")
    Plot("/time/relative", "/rr")
    Plot("/time/relative", "/avg/rr/1")
    Plot("/time/relative", "/avg/rr/2")
    if run == True:
        allon()

def plot_heartrate_bpm(run = True, make_new_figure = True):
    if make_new_figure == True:
    	new_figure("Heartrate (BPM)")
    Plot("/time/relative", "/bpm")
    Plot("/time/relative", "/avg/bpm/1")
    Plot("/time/relative", "/avg/bpm/2")
    if run == True:
        allon()

def plot_network(run = True, make_new_figure = True):
    if make_new_figure == True:
    	new_figure("Network")
    Plot("/time/relative", "/time/network/delta")
    Plot("/time/relative", "/time/delta")
    if(run == True):
        allon()

def plot_model(run = True):
    plot_ecg(run = False)
    plot_heartrate_bpm(run = False)
    Marker("/time/relative", "/zero", "/bpm", "/marker/text")
    Plot("/model/x", "/model/y", color = "#000000")
    #plot_network(run = False)
    if run == True:
    	allon()
    

def plot_all(run = True):
    plot_ecg(run = False)
    Plot("/time/relative", "/respiration/biopac/delayed")
    Plot("/time/relative", "/respiration/fabric/delayed")

    new_figure("Heartrate (BPM) + Respiration")
    Plot("/time/relative", "/bpm")
    Plot("/time/relative", "/avg/bpm/1")
    Plot("/time/relative", "/avg/bpm/2")
    Plot("/time/relative", "/respiration/biopac/t200", color = "#FF00FF")
    Plot("/time/relative", "/respiration/fabric/t200", color = "#00FFFF")
    Marker("/time/relative", "/zero", "/bpm", "/marker/text")

    plot_heartrate_bpm(run = False)
    Marker("/time/relative", "/zero", "/bpm", "/marker/text")
    new_figure("Respiration")
    Plot("/time/relative", "/respiration/biopac/delayed", color = "#FF00FF")
    Plot("/time/relative", "/respiration/fabric/delayed", color = "#00FFFF")
    Marker("/time/relative", "/zero", "/respiration/biopac/delayed", "/marker/text")
    #plot_network(run = False)
    if(run == True):
        allon()

def allon():
    for plot in plots:
        plot.active = True

def alloff():
    for plot in plots:
        plot.active = False

def main(argv):
    global data_port, plot_name, plots, data_thread, update_thread

    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "--name", help="set the name of the plot", default=datetime.datetime.fromtimestamp(time.time()).strftime('%Y%m%d-%H:%M:%S'))
    parser.add_argument("-d", "--data_port", help="set the port for sending data", type=int, default=data_port)

    args = parser.parse_args()

    data_port = args.data_port

    d = vars(args)
    # for i in range(0, nplots):
    #     ii = str(i)
    output_server(d["name"])

        # figure(title = title,
        #        x_axis_label = xlabel,
        #        y_axis_label = ylabel,
        #        plot_width = 1000,
        #        plot_height = 300)
    	# hold()
        # plot = {"x" : [],
        #         "y" : [],
        #         "width" : width,
        #         "xmax" : None,
        #         "plot" : None,
        #         "x_range" : DataRange1d(start = None, end = None),
        #         "ds" : []}
        # for j in range(0, len(addresses) / 2):
        #     plot["x"].append(addresses[j * 2])
        #     plot["y"].append(addresses[j * 2 + 1])
        #     plot["plot"] = line([], [], color=colors[j], tools="box_zoom,pan,previewsave,reset,resize,wheel_zoom", x_range = plot["x_range"])
        #     plot["ds"].append(plot["plot"].renderers[-1].data_source)
	# plots.append(plot)
        

    try:
        data_thread = threading.Thread(target=udp_receive_data, args=[data_port])
        data_thread.start()
    except:
    	print "Error: couldn't start data thread"
        sys.exit(2)
    try:
        update_thread = threading.Thread(target=update_plot)
        update_thread.start()
    except:
    	print "Error: couldn't start update thread"
        sys.exit(2)

    show()

if __name__ == "__main__":
    main(sys.argv[1:])
