#!/usr/bin/python
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os
 
connection = 'postgresql://{}:{}@{}:{}/{}'.format(os.getenv('user', 'doadmin'), os.getenv('password', 'AVNS_CEGtN1btLoTHADqoJEt'),os.getenv('host', 'db-postgresql-ams3-08094-do-user-21717410-0.l.db.ondigitalocean.com'),os.getenv('port', 25060),os.getenv('database', 'defaultdb'))
engine = create_engine(connection,connect_args={'sslmode':'require'})
Session = sessionmaker(bind=engine)

Base = declarative_base()