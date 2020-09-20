#! /usr/bin/python3

import time
from Xlib import X, display


def move_mouse(a, b):
    d = display.Display()
    s = d.screen()
    root = s.root
    root.warp_pointer(a, b)
    d.sync()


for i in range(1, 3):
    move_mouse(i * 100, i * 100)
    print("move mouse here")
    time.sleep(0.05)
