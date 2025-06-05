#!/usr/bin/python
import krakenex
from pykrakenapi import KrakenAPI
api = krakenex.API()
k = KrakenAPI(api)


pairs = ["BTCEUR","NANOEUR","ADAEUR","LINKEUR","XXRPZEUR","DOTEUR"]

logging.info('starting monitoring pair: {}', pairs)

def job():
    logging.info("Fetching data")
    for pair in pairs:
            try:
                ohlc, last = k.get_ohlc_data(pair)
                print(str(ohlc))
            except:
                logging.error("Unexpected error while fetching data for {}: {}", pair, sys.exc_info()[0])
