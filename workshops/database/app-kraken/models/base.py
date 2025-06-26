#!/usr/bin/python
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os

connection = 'postgresql://{}:{}@{}:{}/{}'.format(os.getenv('user', 'test'), os.getenv('password', 'test'),os.getenv('host', '127.0.0.1'),os.getenv('port', 5432),os.getenv('database', 'test'))
engine = create_engine(connection)
Session = sessionmaker(bind=engine)

Base = declarative_base()