# import time
# import threading
#
#
# def foo():
#     print(time.ctime())
#
# WAIT_TIME_SECONDS = 5
#
# ticker = threading.Event()
# while not ticker.wait(WAIT_TIME_SECONDS):
#     foo()


import time
import threading
def foo():
    print(time.ctime())
    threading.Timer(5, foo).start()

foo()