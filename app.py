from flask import Flask, request
from flask_restful import Resource, Api
import sys, os

app = Flask(__name__)
api = Api(app)
port = 5100

print("Api running on port : {} ".format(port)
      
@app.route('/')
def home():
   return "Hello world"    
