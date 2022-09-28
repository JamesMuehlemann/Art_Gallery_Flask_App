#Models (Tables)

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship, backref

db = SQLAlchemy()

class Artist(db.Model):
    __tablename__ = 'artist'
    artist_id = db.Column(db.Integer, primary_key = True, unique = True)
    fname = db.Column(db.String)
    lname = db.Column(db.String)
    dob = db.Column(db.DateTime)
    city = db.Column(db.String)
    country = db.Column(db.String)

    def __init__(self, artist_id, fname, lname, dob, city, country):
        self.artist_id = artist_id
        self.fname = fname
        self.lname = lname
        self.dob = dob
        self.city = city
        self.country = country


class Art(db.Model):
    __tablename__ = 'art'
    art_id = db.Column(db.Integer, primary_key = True, unique = True)
    title = db.Column(db.String)
    type = db.Column(db.String)
    year_made = db.Column(db.Integer)
    means = db.Column(db.String)
    comments = db.Column(db.String)
    artist_id = db.Column(db.Integer, ForeignKey('Artist.artist_id'))
    
    def __init__(self, art_id, title, type, year_made, means, comments, artist_id):
        self.art_id = art_id
        self.title = title
        self.type = type
        self.year_made = year_made
        self.means = means
        self.comments = comments
        self.artist_id = artist_id

class Exhibit(db.Model):
    __tablename__ = 'exhibit'
    exhibit_id = db.Column(db.Integer, primary_key = True, unique = True)
    title = db.Column(db.String)
    start_date = db.Column(db.Date)
    end_date = db.Column(db.Date)
    num_pieces = db.Column(db.Integer)

    def __init__(self, exhibit_id, title, start_date, end_date, num_pieces):
        self.exhibit_id = exhibit_id
        self.title = title
        self.start_date = start_date
        self.end_date = end_date
        self.num_pieces = num_pieces

class Buyer(db.Model):
    __tablename__ = 'buyer'
    buyer_id = db.Column(db.Integer, primary_key = True, unique = True)
    fname = db.Column(db.String)
    lname = db.Column(db.String)
    dob = db.Column(db.String)
    address = db.Column(db.String)
    city = db.Column(db.String)
    state = db.Column(db.String)
    zip = db.Column(db.Integer)
    country = db.Column(db.String)

    def __init__(self, buyer_id, fname, lname, dob, address, city, state, zip, country):
        self.buyer_id = buyer_id
        self.fname = fname
        self.lname = lname
        self.dob = dob
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.country = country

class Transaction(db.Model):
    __tablename__ = 'transaction'
    transaction_id = db.Column(db.Integer, primary_key = True, unique = True)
    price = db.Column(db.Integer)
    purchase_date = db.Column(db.Date)
    buyer_id = db.Column(db.Integer, ForeignKey('Buyer.buyer_id'))
    art_id = db.Column(db.Integer, ForeignKey('Art.art_id'))

    def __init__(self, transaction_id, price, purchase_date, buyer_id, art_id):
        self.transaction_id = transaction_id
        self.price = price
        self. purchase_date = purchase_date
        self.buyer_id = buyer_id
        self.art_id = art_id



