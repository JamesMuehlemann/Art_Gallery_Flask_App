--Candice Lee, James Muehlemann, and Jihoon Park
--CIS9340
--The implementation of the Art Gallery database, creating and populating tables 
-- Views will resemble the reports we would do in Access

--Create the Artist table
create table Artist(
    artist_id VARCHAR(4) NOT NULL,
    fname VARCHAR (32),
    lname VARCHAR (32),
    dob DATE,
    city VARCHAR (32),
    country VARCHAR (32),
    PRIMARY KEY (artist_id)
);

--create the Art table and show the relationship
create table Art(
    art_id VARCHAR(4) NOT NULL,
    title VARCHAR (64), 
    type VARCHAR (32),
    year_made INT,
    means VARCHAR(64),
    comments VARCHAR(64),
    artist_id CHAR (4),
    PRIMARY KEY(art_id), 
    FOREIGN KEY(artist_id) REFERENCES Artist(artist_id)
);

--Create the Exhibit table 
create table Exhibit(
    exhibit_id VARCHAR(4) NOT NULL,
    title VARCHAR (32),
    start_date DATE,
    end_date DATE,
    num_pieces INT,
    PRIMARY KEY (exhibit_id)
);

--Create the Buyer table 
create table Buyer(
    buyer_id VARCHAR(4) NOT NULL,
    fname VARCHAR (32),
    lname VARCHAR (32), 
    dob DATE,
    address VARCHAR (32),
    city VARCHAR (32),
    state CHAR (32),
    zip INT,
    country VARCHAR (32),
    PRIMARY KEY (buyer_id)
);

--Create the Transaction table
create table Transaction(
    transaction_id VARCHAR(4) NOT NULL,
    price INT,
    purchase_date DATE,
    buyer_id CHAR(4),
    art_id CHAR(4),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id),
    FOREIGN KEY (art_id) REFERENCES Art(art_id)
);

--Insertion statements in order to populate the database with tuples
INSERT INTO Artist (Artist_id, fname, lname,  Dob, City, Country)
VALUES ('A37', 'Yayoi', 'Kusama', DATE '03/22/1929', 'Matsumoto', 'Japan'),
('A60', 'Keith', 'Haring', DATE '05/04/1958', 'New York', 'United States'),
('A72', 'Peter', 'Doig', DATE '04/17/1959', 'Edinburgh', 'United Kingdom'),
('A12', 'Frida', 'Kahlo', DATE '07/06/1907', 'Mexico City', 'Mexico'),
('A1', 'Pablo', 'Picasso', DATE '10/25/1881', 'Mougins', 'France'),
('A4', 'Salvador', 'Dali', DATE '05/11/1904', 'Figueres', 'Spain'),
('A36', 'Andy', 'Warhol', DATE '08/06/1928', 'New York', 'United States'),
('A59', 'Jeff', 'Koons', DATE '01/21/1955', 'Pennsylvania', 'United States'),
('A57', 'Cindy', 'Sherman', DATE '01/19/1954', 'New Jersey', 'United States'),
('A3', 'Alvar', 'Aalto', DATE '02/03/1898', 'Helsinki', 'Finland');

--Select statement to ensure all insertions are in the Artist table.
SELECT * FROM ARTIST;

INSERT INTO Art (Art_id, Title, Type, Year_made, Means, Comments, Artist_id)
VALUES ('AA10', 'Vase(3031)', 'Glasswork', '1936', 'Mold-blown glass', 'Gift of Rob Beyer', 'A3'),
('AA13', 'Stacking Stools (model 60)', 'Furniture', '1933', 'Birch', 'Gift of Artek-Pascoe, Inc.', 'A3'),
('SC6', 'Untitled Film Still #52', 'Film', '1979', 'Gelatin silver print', 'Black-and-white', 'A57'),
('SC22', 'Untitled from 1989', 'Film', '2000', 'Chromohenic color print', '75 ed.', 'A57'),
('KJ12', 'Pink Panther', 'Sculpture', '1988', 'Porcelain on formica base', 'Depicts Jayne Mansfield', 'A59'),
('WA2', 'Campbell’s Soup Cans', 'Painting', '1962', 'Acrylic with metallic enamel paint on canvas', '32 panels', 'A36'),
('WA37', 'Untitled from Marilyn Monroe', 'Printmaking', '1967', 'One from a portfolio of ten screenprints', '250 ed.', 'A36'),
('DS1', 'The Persistence of Memory', 'Painting', '1931', 'Oil on canvas', 'Given anonymously', 'A4'),
('PP45', 'Card Player', 'Painting', '1914', 'Oil on canvas', 'Paris, winter', 'A1'),
('PP57', 'Pierrot', 'Painting', '1918', 'Oil on canvas', 'Copyright ARS, NY', 'A1'),
('KF12', 'My Grandparents, My Parents, and I (Family Tree)', 'Painting', '1936', 'Oil and tempera on zinc', 'Gift of Roos', 'A12'),
('DP3', 'House of Flowers (see you there)', 'Painting', '2009', 'Oil on canvas', 'Depicts a lone man', 'A72'),
('HK62', 'Radiant Baby', 'Printmaking', '1990', 'Silkscreen', 'Icons series, 250 ed.', 'A60'),
('KY20', 'Dots Obsession', 'Installation', '2003', 'Mixed', 'Polka dots and mirrors', 'A37'),
('KY27', 'Infinity Nets (for Parkett no. 59)', 'Installation', '2000', 'Multiple of screenprint on mirror', '70 ed.', 'A37');

--Select statement to ensure all insertions are in the Art table.
SELECT * FROM Art;

INSERT INTO Exhibit (Exhibit_id, Title, Start_date, End_date, Num_pieces)
VALUES ('E183', 'Design for Modern Life', DATE '06/12/2018', DATE '09/30/2018', '34'),
('E191', 'A Surrealist Art History', DATE '01/06/2019', DATE '06/22/2019', '22'),
('E204', 'The Art of the Multiple', DATE '03/03/2020', DATE '11/29/1920', '50'),
('E207', 'Masters of Popular Painting', DATE '04/17/2020', DATE '05/27/2020', '47'),
('E209', 'Abstract Lens', DATE '09/17/2020', DATE '12/25/2020', '38');

--Select statement to ensure all insertions are in the Exhibit table.
SELECT * FROM Exhibit;

INSERT INTO Buyer (Buyer_id, fname, lname, Dob, Address, City, State, Zip, Country)
VALUES ('B1', 'Esther', 'Barnes', DATE '03/08/1969', '7274 Hamilton Dr', 'Brooklyn', 'New York', 11218, 'United States'),
('B9', 'Hilda', 'Moore', DATE '12/30/1989', '3715 Jacob Dr', 'Shawsville', 'Virginia', 24162, 'United States'),
('B11', 'Luke', 'Barnett', DATE '01/16/1993', '90 Cross St', 'Brockton', 'Massachusetts', 02301, 'United States'),
('B12', 'Benjamine', 'Daniels', DATE '05/17/1990', '565 Mockingbird Way', 'Warrington', 'Pennsylvania', 18976, 'United States'),
('B19', 'Gloria', 'Francis', DATE '11/20/1972', '26 New Amwell Rd', 'Hillsborough', 'New Jersey', 08844, 'United States'),
('B22', 'Derek', 'Lee', DATE '08/01/1974', '537 Grant St', 'Franklin', 'Pennsylvania', 16323, 'United States'),
('B24', 'Andy', 'Austin', DATE '07/29/1989', '13222 Midway Ave', 'Rockville', 'Maryland', 20851, 'United States'),
('B25', 'Kathy', 'Logan', DATE '04/08/1975', '4107 12th St', 'Long Island City', 'New York', 11101, 'United States'),
('B37', 'Amelia', 'Wagner', DATE '10/23/1971', '290 9th Ave', 'New York', 'New York', 10001, 'United States'),
('B50', 'Lucas', 'Taylor', DATE '02/14/1962', '80 Park Ave', 'Hoboken', 'New Jersey', 07030, 'United States');

--Select statement to ensure all insertions are in the Buyer table.
SELECT * FROM Buyer;

INSERT INTO Transaction (Transaction_id, Buyer_id, Art_id, Price, Purchase_date)
VALUES ('T183', 'B50', 'PP57', 35000, DATE '06/13/2018'),
('T189', 'B9', 'AA10', 5800, DATE '06/22/2018'),
('T191', 'B50', 'DS1', 12000, DATE '02/17/2019'),
('T194', 'B19', 'KJ12', 8000, DATE '05/05/2019'),
('T195', 'B12', 'DP3', 3000, DATE '06/10/2019'),
('T202', 'B22', 'PP45', 57000, DATE '03/29/2020'),
('T203', 'B1', 'AA13', 6300, DATE '05/16/2020'),
('T206', 'B25', 'WA2', 24000, DATE '08/23/2020'),
('T207', 'B37', 'SC6', 1500, DATE '09/28/2020'),
('T208', 'B11', 'KF12', 4600, DATE '12/23/2020');

--Select statement to ensure all insertions are in the Transaction table.
SELECT * FROM Transaction;


--Views shown below are to represent reports that someone might make at an art gallery
--First report shows first and last name of a Buyer, the title and price of the artwork as well as when he or she bought it.
CREATE OR REPLACE VIEW BuyerReport as
SELECT b.fname, b.lname , a.title, t.purchase_date, t.price
FROM Buyer b 
JOIN Transaction t ON (b.buyer_id = t.buyer_id)
JOIN Art a ON (t.art_id = a.art_id);
--Show the buyer report
SELECT * FROM BuyerReport;

--Second report shows the name of the artist and info about the art he or she created.
CREATE OR REPLACE VIEW ArtReport as
SELECT r.fname, r.lname, a.title, a.year_made, a.means, a.comments
FROM artist r 
JOIN art a ON (r.artist_id = a.artist_id);
--Show the art report
SELECT * FROM ArtReport;

--These queries shown below are to test that the UI is working 
--Shows that the artist in the form was successfully inserted into the database
SELECT * FROM Artist;
--Delete this artist from the database
DELETE FROM Artist a WHERE a.artist_id = 'A27';

--Shows that the buyer in the buyer form was successfully inserted into the database
SELECT * FROM Buyer;
--Delete this buyer from the database
DELETE FROM Buyer b WHERE b.buyer_id = 'B28';

