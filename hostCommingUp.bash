#! /bin/bash

#FIX IT
 
until ping -c 1 -W 1 $1 > /dev/null;  do sleep 1; done; play alarm.wav 
