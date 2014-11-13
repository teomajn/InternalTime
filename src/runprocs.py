import json
import os
import signal
import subprocess
import sys
import threading
import time
import socket
sys.path.append("/Users/john/Development/CNMAT/CNMAT/libo")
import libo as o

class Proc:
    devnull = open(os.devnull, 'w')
    def __init__(self, name, args = "", keepalive = False, pidfilename = "pids.json", stdout = devnull, stdin = sys.stdin, stderr = devnull):
        self.name = name
        self.args = args
        self.keepalive = keepalive
        self.pidfilename = pidfilename
        self.stdout = stdout
        self.stdin = stdin
        self.stderr = stderr

    def _run(self, onexit):
        devnull = open(os.devnull, 'w')
        try:
            self.proc = subprocess.Popen(self.args, stdout = self.stdout, stderr = self.stderr, stdin = self.stdin)
        except OSError as error:
            raise OSError(error.errno, "unable to execute: %s" % " ".join(self.args))

        self.add_to_pidfile()
        self.closed = False
        
	print self.name + ": " + str(self.proc.pid)

        self.proc.wait()
        onexit()

    def run(self):
        th = threading.Thread(target = self._run, args = [self.onexit])
        th.start()
        
    def stop(self):
        self.keepalive = False
        self.proc.terminate()

    def onexit(self):
        if self.keepalive == True:
            self.run()

    def read_pidfile(self):
        if(os.path.exists(self.pidfilename)):
            with open(self.pidfilename, "r") as f:
                data = json.load(f)
	else:
            data = {}
        return data

    def add_to_pidfile(self):
        data = self.read_pidfile()
        data[self.name] = self.proc.pid
        with open(self.pidfilename, "w+") as f:
            json.dump(data, f)
            
    def remove_from_pidfile(self):
        data = self.read_pidfile()
        if self.name in data:
            del data[self.name]
        with open(self.pidfilename, "w+") as f:
            json.dump(data, f)
    
    def close(self):
        if not self.closed:
            self.proc.kill()
            self.proc.communicate()
            self.remove_from_pidfile()
            self.closed = True

def get_int_for_address(address, bndl_u):
    msgs = o.osc_bundle_u_lookupAddress_r(bndl_u, address, 1)
    if o.osc_array_getLen(msgs) > 0:
        msg = o.osc_array_get(msgs, 0)
        for i in range(0, o.osc_message_u_getArgCount(o.void_to_osc_message_u(msg))):
            atom = o.osc_message_u_getArg_r(o.void_to_osc_message_u(msg), i)
            f = o.osc_atom_u_getInt(atom)
            o.osc_array_free(msgs)
            return f
    o.osc_array_free(msgs)
    return None

def launch_a_bunch_of_copies_of_max(n, f = "", keepalive = False):
    sockr = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sockr.bind(("127.0.0.1", 12000))
    socks = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    #socks.bind(("127.0.0.1", 12001))
    for i in range(0, n):
    	p = Proc("/max/" + str(i), args = ['arch', '-32', '/Applications/Max 6.1/Max.app/Contents/MacOS/Max', f], keepalive = keepalive)
        p.run()
        data, addr = sockr.recvfrom(1024)
        bndl_u = o.osc_bundle_s_deserialize_r(len(data), data)
        port = get_int_for_address("/get/port", bndl_u)
        return_bndl_u = o.osc_bundle_u_alloc()
        o.osc_bundle_u_addMsg(return_bndl_u, o.osc_message_u_allocWithInt("/set/port", 6000 + i))
        return_bndl = o.osc_bundle_u_serialize_r(return_bndl_u)
        socks.sendto(return_bndl, ("127.0.0.1", port))
        time.sleep(.5)
    sockr.close()
    socks.close()
