#!/usr/bin/env python

from __future__ import absolute_import

#import serial
#import spidev
#import RPi.GPIO as GPIO
import os
import sys
import logging
import subprocess

from time import *

logging.basicConfig(level=logging.DEBUG, stream=sys.stdout, format='[%(name)s] %(message)s')
logger = logging.getLogger(__name__)


def readadc(adcnum):
# read SPI data from MCP3008 chip, 8 possible adc's (0 thru 7)
    if adcnum > 7 or adcnum < 0:
        return -1
    r = spi.xfer2([1, 8 + adcnum << 4, 0])
    adcout = ((r[1] & 3) << 8) + r[2]
    return adcout


def main():
    preset = 0
    preset_old = 0
    name_file = open ("/home/pi/Download/Git/rpieffect/names.txt")
    names = name_file.read().splitlines()
    logger.debug('* Effect names: {}'.format(names))

    function_file = open ("/home/pi/Download/Git/rpieffect/functions.txt")
    functions = function_file.read().splitlines()
    logger.debug('* Functions names: {}'.format(functions))

    subprocess.call("pd -nogui server.pd &", shell=True)
    sleep(0.2)
    os.system("echo '0 "+ str(preset) +";' | pdsend 5000 localhost")

    while True:
        sleep(.01)
        logger.info('****************************************')
        logger.info('\t{}'.format(names[preset]))
        logger.info('****************************************')
        logger.info('0 - Previous effect ({})'.format(names[preset-1]))
        logger.info('1 - Next effect ({})'.format(names[preset+2]))
        logger.info('2 - Config ({})'.format(names[preset]))
        logger.info('Else: Exit')
        logger.info('****************************************')
        inp = raw_input('?')
        if ((inp == '0') and (preset > 0)):
            preset_old = preset
            preset = preset - 1
            os.system("echo '1 "+ str(preset_old) +";' | pdsend 5000 localhost")
            os.system("echo '0 "+ str(preset) +";' | pdsend 5000 localhost")
        elif ((inp == '1') and preset < len(names) - 1):
            preset_old = preset
            preset = preset + 1
            os.system("echo '1 "+ str(preset_old) +";' | pdsend 5000 localhost")
            os.system("echo '0 "+ str(preset) +";' | pdsend 5000 localhost")
        elif (inp == '2'):
            sleep(.2)
            while True:
                value0 = readadc(0)
                value1 = readadc(1)
                value2 = readadc(2)
                value3 = readadc(3)
                os.system("echo '3 " + str(value0) + ";' | pdsend 5001 localhost udp")
                os.system("echo '0 " + str(value1) + ";' | pdsend 5001 localhost udp")
                os.system("echo '1 " + str(value2) + ";' | pdsend 5001 localhost udp")
                os.system("echo '2 " + str(value3) + ";' | pdsend 5001 localhost udp")
                ser.write("?fE1:" + str(value3) + " E2:" + str(value2) + "?nE3:" + str(value1) + " E4:" + str(value0))
                if (GPIO.input(4) > 0):
                    sleep(.2)
                    ser.write("?f" + str(names[preset]) + "?n" + str(functions[preset]))
                    break
        else:
            sys.exit(0)

if __name__ == '__main__':
    main()
