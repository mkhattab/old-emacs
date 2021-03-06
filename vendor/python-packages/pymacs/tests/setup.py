# -*- coding: utf-8 -*-

# Python side of the testing protocol.




__metaclass__ = type
import os

try:
    import signal
except ImportError:
    # Jython misses this module.
    signal = None

try:
    import subprocess
except ImportError:
    # Jython misses this module.
    subprocess = None

# Make sure that ../Pymacs will be found within this process.
import sys
if '..' not in sys.path:
    sys.path.insert(0, '..')

from Pymacs import lisp, pymacs

class Launch:
    # Make sure that ../Pymacs will be found in external processes.

    def __init__(self):
        self.pythonpath_saved = os.environ.get('PYTHONPATH')
        os.environ['PYTHONPATH'] = '..'

    def __del__(self):
        if self.pythonpath_saved is None:
            del os.environ['PYTHONPATH']
        else:
            os.environ['PYTHONPATH'] = self.pythonpath_saved

class Emacs(Launch):
    # Requests towards Emacs are written to file "_request", while
    # replies from Emacs are read from file "_reply".  We call Emacs
    # attention by erasing "_reply", and Emacs calls our attention by
    # erasing "_request".  These rules guarantee that no file is ever
    # read by one side before it has been fully written by the other.
    # Busy waiting, with built-in delays, is used on both sides.

    popen = None

    def __init__(self):
        Launch.__init__(self)
        self.cleanup()
        import atexit
        atexit.register(self.cleanup)
        emacs = os.environ.get('EMACS') or 'emacs'
        self.command = emacs, '-batch', '--no-site', '-q', '-l', 'setup.el'
        if subprocess is None:
            self.command = self.command + ('-f', 'run-one-request')
        else:
            self.command = self.command + ('-f', 'run-all-requests')

    def cleanup(self):
        if self.popen is not None:
            self.popen.poll()
            if self.popen.returncode is None:
                if signal is not None:
                    os.kill(self.popen.pid, signal.SIGINT)
                    os.waitpid(self.popen.pid, 0)
            self.popen = None
        if os.path.exists('_request'):
            os.remove('_request')
        if os.path.exists('_reply'):
            os.remove('_reply')

    def receive(self):
        if subprocess is None:
            handle = open('_reply')
            buffer = handle.read()
            handle.close()
        else:
            import time
            while os.path.exists('_request'):
                self.popen.poll()
                assert self.popen.returncode is None, self.popen.returncode
                time.sleep(0.005)
            self.popen.poll()
            assert self.popen.returncode is None, self.popen.returncode



            handle = open('_reply')
            buffer = handle.read()
            handle.close()
        return buffer

    def send(self, text):



        handle = open('_request', 'w')
        handle.write(text)
        handle.close()
        if subprocess is None:
            status = os.system(' '.join(self.command))
            assert status == 0, status
        else:
            if os.path.exists('_reply'):
                os.remove('_reply')
            if self.popen is None:
                self.popen = subprocess.Popen(self.command)
            self.popen.poll()
            assert self.popen.returncode is None, self.popen.returncode

def start_emacs():
    Emacs.services = Emacs()

def stop_emacs():
    Emacs.services.cleanup()

def ask_emacs(text, printer=None):
    if printer is not None:
        text = '(%s %s)' % (printer, text)
    Emacs.services.send(text)
    return Emacs.services.receive()

class Python(Launch):

    def __init__(self):
        Launch.__init__(self)
        # Start a Pymacs helper subprocess for executing Python code.
        import subprocess
        self.process = subprocess.Popen(
                [os.environ.get('PYTHON') or 'python',
                    '-c', 'from Pymacs.pymacs import main; main(\'..\')'],
                stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        text = self.receive()
        assert text == '(version "0.24-beta2")\n', repr(text)





















    def receive(self):
        # Receive a Lisp expression from the Pymacs helper.
        stdout = self.process.stdout
        data = stdout.read(3)
        if not data or data[0] != '<':
            if data == 'Tra':
                # Likely a traceback, and the Pymacs helper terminated.
                diagnostic = 'got:\n' + data + stdout.read()
            else:
                diagnostic = 'got ' + repr(data)
            raise pymacs.ProtocolError("'<' expected, %s\n" % diagnostic)
        while data[-1] != '\t':
            data += stdout.read(1)
        return stdout.read(int(data[1:-1]))


















    def send(self, text):
        # Send TEXT, a Python expression, to the Pymacs helper.
        stdin = self.process.stdin
        if text[-1] == '\n':
            stdin.write('>%d\t%s' % (len(text), text))
        else:
            stdin.write('>%d\t%s\n' % (len(text) + 1, text))
        stdin.flush()

def start_python():
    Python.services = Python()

def stop_python():
    Python.services.process.kill()

def ask_python(text):
    Python.services.send(text)
    return Python.services.receive()
