#!/usr/bin/python3
import logging
from flask import Flask, request

logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.DEBUG)

app = Flask(__name__)

@app.route('/')
def hello_world():
   return 'Bonjour à tous'