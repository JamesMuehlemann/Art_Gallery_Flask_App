
from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from models import *
from wtform_fields import *

#NOTES
#use flask run to run the server
#wtforms to make the forms

#Need to use your own password to postgres where it says INSERT_PW_HERE in order to insert the artist into
app = Flask(__name__)
app.secret_key = 'Quasimoto'
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:Cavendish1238!@localhost/Art_Gallery"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
db.init_app(app)
migrate = Migrate(app, db)

#routing for the user menu 
@app.route('/', methods = ['POST', 'GET'])
def user_menu():
    user_menu = User_Menu()
    if user_menu.validate_on_submit():
        return redirect(url_for('artist_form'))

    if user_menu.validate_on_submit():
        return redirect(url_for('buyer_form'))
    
    if user_menu.validate_on_submit():
        return redirect(url_for('buyer_report'))

    if user_menu.validate_on_submit():
        return redirect(url_for('art_report'))

    return render_template("user_menu.html", form = user_menu)

#Routing for the artist form
@app.route('/artist_form', methods = ['POST', 'GET'])
def artist_form():

    artist_form = Artist_Form()
    if artist_form.validate_on_submit():
        artist_id = artist_form.artist_id.data
        fname = artist_form.fname.data
        lname = artist_form.lname.data
        dob = artist_form.dob.data
        city = artist_form.city.data
        country = artist_form.country.data

        artist_object = Artist.query.filter_by(artist_id=artist_id).first()
        if artist_object:
            return("This artist already exists.")



        artist = Artist(artist_id=artist_id, fname=fname, lname=lname, dob=dob, city=city,country=country)
        db.session.add(artist)
        db.session.commit()
        return redirect(url_for('artist_form'))

        if user_menu.validate_on_submit():
            return redirect(url_for('user_menu'))


    return render_template("artist_form.html", form = artist_form)

#Routing for the buyer form
@app.route('/buyer_form', methods = ['POST', 'GET'])
def buyer_form():

    buyer_form = Buyer_Form()
    if buyer_form.validate_on_submit():
        buyer_id = buyer_form.buyer_id.data
        fname = buyer_form.fname.data
        lname = buyer_form.lname.data
        dob = buyer_form.dob.data
        address = buyer_form.address.data
        city = buyer_form.city.data
        state = buyer_form.state.data
        zip = buyer_form.zip.data
        country = buyer_form.country.data

        buyer_object = Buyer.query.filter_by(buyer_id=buyer_id).first()
        if buyer_object:
            return("This buyer already exists.")

        buyer = Buyer(buyer_id=buyer_id, fname=fname, lname=lname, dob=dob, address=address, city=city,state=state,zip=zip,country=country)
        db.session.add(buyer)
        db.session.commit()
        return redirect(url_for('buyer_form'))

        if user_menu.validate_on_submit():
            return redirect(url_for('user_menu'))


    return render_template("buyer_form.html", form = buyer_form)


#Routing for buyer report
@app.route('/buyer_report', methods = ['POST', 'GET'])
def buyer_report():
    buyer_report = Buyer_Report()
    if buyer_report.validate_on_submit():
        if user_menu.validate_on_submit():
            return redirect(url_for('user_menu'))

    return render_template("buyer_report.html", form = buyer_report)

#Routing for art report 
@app.route('/art_report', methods = ['POST', 'GET'])
def art_report():
    art_report = Art_Report()
    if art_report.validate_on_submit():
        if user_menu.validate_on_submit():
            return redirect(url_for('user_menu'))

    return render_template("art_report.html", form = art_report)

if __name__ == "__main__":
    app.run(debug = True) 