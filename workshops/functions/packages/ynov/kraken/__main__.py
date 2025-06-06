#!/usr/bin/python
import krakenex
from pykrakenapi import KrakenAPI
api = krakenex.API()
k = KrakenAPI(api)
import time
import sys

pairs = ["BTCEUR","NANOEUR","ADAEUR","LINKEUR","XXRPZEUR","DOTEUR"]


def job():
    for pair in pairs:
            try:
                ohlc, last = k.get_ohlc_data(pair)
                print("********* "+pair)
                print(str(ohlc))
                time.sleep(1)
            except:
                print("Unexpected error while fetching data for {}: {}", pair, sys.exc_info()[0])

job()