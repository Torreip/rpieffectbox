#!/usr/bin/env python

from __future__ import absolute_import

#import serial
#import spidev
#import RPi.GPIO as GPIO
import os
import sys
import logging
import subprocess
import json

from time import *

logging.basicConfig(level=logging.DEBUG, stream=sys.stdout, format='[%(name)s] %(message)s')
logger = logging.getLogger(__name__)


cfg_f = 'funcs.json'


class PureData:
    def __init__(self, do_start = True, port = 5000, suffix = ''):
        self.bin = 'pd'
        self.opt_l = ['nogui']
        self.script = 'server.pd'
        self.sndMsg = " | pdsend {} localhost {}".format(port, suffix)
        if do_start:
            self.start()

    def start(self):
        logger.debug('* Starting puredata')
        cmd = "{}{} {} &".format(self.bin, " -".join([''] + self.opt_l), self.script)
        # logger.debug('==> {}'.format(cmd))
        subprocess.call(cmd, shell=True)

    def send(self, in_nr, in_dat):
        cmd = "echo '{} {};'".format(in_nr, in_dat)
        cmd += self.sndMsg
        # logger.debug('==> {}'.format(cmd))
        ret = subprocess.call(cmd, shell=True)


def main():
    """ where everything happens"""

    # loading config (must match pure data files in the directory)
    with open(cfg_f, 'r') as fid:
        func_d2 = json.load(fid)

    # json dic is not taking numbers as keys? converting
    func_d = {}
    for key in func_d2:
        func_d[int(key)] = func_d2[key]

    nr_f = len(func_d)

    preset = 0
    preset_old = 0

    pd = PureData()
    sleep(0.2)
    pd.send(0, preset)

    # sending params on different port
    pd_opt = PureData(False, 5001, 'udp')

    while True:
        sleep(.01)
        logger.info('****************************************')
        logger.info('\t{}'.format(func_d[(preset) % nr_f]['name']))
        logger.info('****************************************')
        logger.info('0 - Previous effect ({})'.format(func_d[(preset-1) % nr_f]['name']))
        logger.info('1 - Next effect ({})'.format(func_d[(preset+1) % nr_f]['name']))
        logger.info('2 - Configure {}'.format(func_d[preset]['name']))
        logger.info('   >  {}'.format(', '.join(func_d[preset]["func"])))
        logger.info('Else: Exit')
        logger.info('****************************************')
        inp = raw_input('?')
        if inp == '0':
            preset_old = preset
            preset = (preset-1) % nr_f
            pd.send(1, preset_old)
            pd.send(0, preset)
        elif inp == '1':
            preset_old = preset
            preset = (preset+1) % nr_f
            pd.send(1, preset_old)
            pd.send(0, preset)
        elif (inp == '2'):
            sleep(.2)
            for f in func_d[preset]["func"]:
                logger.info('* {}'.format(f))
                val = raw_input('?')
                idx = func_d[preset]["func"].index(f)
                pd_opt.send((idx-1) % 4, val)
        else:
            pd.send(1, preset)
            sleep(0.1)
            # super ugly
            ret = subprocess.call('sudo killall pd', shell=True)
            sys.exit(0)


if __name__ == '__main__':
    main()
