import logging
import sys

def get_logger():
    TIME_FORMAT = '%a %b %-d %Y %-I:%M:%S %p'
    logformat = '%(asctime)s [%(levelname)s] %(name)s: %(message)s'                 
    formatter = logging.Formatter(fmt=logformat, datefmt=TIME_FORMAT) 
    log = logging.getLogger("datacollect")
    log.setLevel(logging.INFO)
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setFormatter(formatter)
    log.addHandler(console_handler)
    return log