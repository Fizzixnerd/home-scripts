#!/bin/bash

xinput --set-prop --type=int --format=8 "ETPS/2 Elantech Touchpad" "Synaptics Two-Finger Scrolling" 1 1
xinput --set-prop --type=int --format=8 "ETPS/2 Elantech Touchpad" "Synaptics Palm Detection" 1
xinput --set-prop --type=float --format=32 "ETPS/2 Elantech Touchpad" "Synaptics Coasting Speed" 20.0 25.0
xinput --set-prop --type=int --format=32 "ETPS/2 Elantech Touchpad" "Synaptics Soft Button Areas" 0 0 0 0 0 0 0 0
xinput --set-prop --type=int --format=8 "ETPS/2 Elantech Touchpad" "Synaptics Click Action" 1 3 2
xinput --set-prop --type=int --format=8 "ETPS/2 Elantech Touchpad" "Synaptics Tap Action" 1 3 2

