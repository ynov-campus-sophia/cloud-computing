#!/usr/bin/python
import krakenex
import json
import sys
import pandas as pd
from pykrakenapi import KrakenAPI
api = krakenex.API()
k = KrakenAPI(api)
import psycopg2
import pandas as pd
import datetime
import schedule
import time
import utils
from fastapi import FastAPI
from contextlib import asynccontextmanager
from apscheduler.schedulers.background import BackgroundScheduler 
from apscheduler.triggers.cron import CronTrigger 
import settings
from models.ohlc import Ohlc
from models.base import Session, engine, Base

logger = utils.get_logger()

pairs = ["BTCEUR","NANOEUR","ADAEUR","LINKEUR","XXRPZEUR","DOTEUR"]

logger.info('starting monitoring pair: %s', pairs)

def insertToTable(df, pair):
    last = df.iloc[0]
    logger.info(last)
    dt = datetime.datetime.fromtimestamp(last['time'], tz=datetime.timezone.utc)
    
    try:
        ohlc = Ohlc(dt, last.open, last.close, last.high, last.low, last.volume, pair, "kraken")
        session.add(ohlc)
        session.commit()
    except:
        logger.error("Unexpected error while saving: %s", sys.exc_info()[0])
        session.rollback()

def job():
    logger.info("Fetching data")
    for pair in pairs:
            try:
                ohlc, last = k.get_ohlc_data(pair)
                insertToTable(ohlc, pair)
                logger.info("fetced data for %s: %s", pair, str(ohlc))
                time.sleep(1)
            except:
                logger.error("Unexpected error while fetching data for %s: %s", pair, sys.exc_info()[0])



# Set up the scheduler
scheduler = BackgroundScheduler()
trigger = CronTrigger(hour="*", minute="*")  # every minute
scheduler.add_job(job, trigger)
scheduler.start()

app = FastAPI()

# Ensure the scheduler shuts down properly on application exit.
@asynccontextmanager
async def lifespan(app: FastAPI):
    yield
    scheduler.shutdown()

@app.get("/")
def read_root():
    return {"message": "FastAPI with APScheduler Demo"}

@app.on_event("startup")
async def startup():
    logger.info("Current settings : %s", settings)


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=5000)
