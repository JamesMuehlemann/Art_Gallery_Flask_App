from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, DateField
from wtforms.validators import InputRequired, Length


class Artist_Form(FlaskForm):
    artist_id = StringField('artist_id_label', validators=[Length(max=4, message= "Length must be no more than 4 characters.")])
    fname = StringField('fname_label', validators=[Length(max=32, message= "Length must be no more than 4 characters.")])
    lname = StringField('lname_label', validators=[Length(max=32, message="Length must be no more than 32 characters.")])
    dob = DateField('dob_label', format = '%m/%d/%Y')
    city = StringField('city_label', validators=[Length(max=32, message="Length must be no more than 32 characters.")])
    country = StringField('country_label', validators=[Length(max=32, message="Length must be no more than 32 characters.")])
    add_artist_button = SubmitField('Add Artist')
    user_menu_button = SubmitField('Back to User Menu')

class Buyer_Form(FlaskForm):
    buyer_id = StringField('buyer_id_label', validators=[Length(max=4,message= "Length must be no more than 4 characters.")])
    fname = StringField('fname_label', validators=[Length(max=32, message= "Length must be no more than 4 characters.")])
    lname = StringField('lname_label', validators=[Length(max=32, message="Length must be no more than 32 characters.")])
    dob = DateField('dob_label', format = '%m/%d/%Y')
    address = StringField('address_label', validators=[Length(max=32, message="Length must be no more than 32 characters.")])
    city = StringField('city_label', validators=[Length(max=32, message="Length must be no more than 32 characters.")])
    state = StringField('state_label', validators=[Length(max=32, message="Length must be no more than 32 characters.")])
    zip = StringField('zip_label')
    country = StringField('country_label', validators=[Length(max=32, message="Length must be no more than 32 characters.")])
    add_buyer_button = SubmitField('Add Buyer')
    user_menu_button = SubmitField('Back to User Menu')


class User_Menu(FlaskForm):
    artist_form_button = SubmitField('Artist Form')
    buyer_form_button = SubmitField('Buyer Form')
    buyer_report_button = SubmitField('Buyer Report')
    art_report_button = SubmitField('Art Report')


class Buyer_Report(FlaskForm):
        user_menu_button = SubmitField('Back to User Menu')

class Art_Report(FlaskForm):
        user_menu_button = SubmitField('Back to User Menu')

