## CapyBnB

![CapyBnB Logo](./images/CapyBnb_logo.png)

A different AirBnb.

* How to download and run CapyBnb locally:

```
$ git clone git@github.com:sim-ware/byte4-makers-bnb.git
$ cd byte4-makers-bnb
$ createdb makers_bnb_development
$ createdb makers_bnb_test
$ bundle install
$ rackup -p 4567
```
visit <http://localhost:4567/>

* Enjoy CapyBnB online on  **Heroku**: https://capybnb.herokuapp.com/

Chitter uses the following **technologies**:
* `gem 'data_mapper'` - [DataMapper](http://datamapper.org/) a Object-Relational Map (ORM) that 'speaks ruby' to interact with databases.
* `gem 'dm-postgres-adapter'` - [PostgresQL](https://www.postgresql.org/) an open source relational database management system (DBMS).
* `gem 'bcrypt'` - [BCrypt](https://github.com/codahale/bcrypt-ruby) a library to encrypt/decrypt strings to keep passwords safe.
* And - of course - [Sinatra](http://www.sinatrarb.com/) to develop Ruby Web Applications.

#### 1.0 User can sign-in and sign-up
```
User Story 1.1
---------------
As a User;
So that I can be a host and/or a guest;
I want to sign up for MakersBnB.


User Story 1.2
--------------
As a User;
So that I can book or list a property;
I want to log in to MakersBnB.


User Story 1.3
--------------
As a User;
So that I can avoid others dealing with my properties;
I want to be able to log out of MakersBnB.
```

#### 2.0 Any signed-up user can list a new space.
```
User Story 2.1
--------------
As a User;
So that potential guests can see my property;
I want to be able to list it on MakerBnB and see it listed.

User Story 2.2
--------------
As a not-signed-up User;
To prevent me from messing up with the website;
I don’t want to be able to list anything on the website.
```

#### 3.0 Users can list multiple spaces.
```
User Story 3.1
--------------
As a User;
So that I can rent out all of my properties;
I want to be able to list multiple properties on Makers BnB.
```

#### 4.0 Users should be able to name their space, provide a short description of the space, and a price per night.
```
User Story 4.1
--------------
As a User;
So that I can better market my property;
I want to be able to name it as I want.

User Story 4.2
--------------
As a User;
So that I can give guests more information;
I want to be able to include a short description.

User Story 4.3
--------------
As a User;
So that the customer knows the price;
I want to be able to include a price per night.

User Story 4.4*
--------------
As a User;
So that I can be more attractive internationally;
I want to be able to quote the price in a range of currencies.

User Story 4.5*
--------------
As a User;
So that I can better market the property;
I want to be able to include pictures of my property.

User Story 4.6*
--------------
As a User;
So that guests can filter my property by features;
I want to be able to choose tags to my property.
```

#### 5.0 Users should be able to offer a range of dates where their space is available.
```
User Story 5.1
--------------
As a Host;
So that I can tell guests when the property is available;
I want to be able to state the available dates.

User Story 5.2
--------------
As a Guest;
So that I can book a stay at a property;
I want to be able to see the availability of a property.
```

#### 6.0 Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
```
User Story 6.1
--------------
As a Guest;
So that I can make a booking for 1 night;
I want to be able to send a request to the Host.

User Story 6.2
--------------
As a Host;
So that I can manage bookings;
I want to be able to approve guests’ requests.

User Story 6.3
--------------
As a not-signed-up Guest;
To prevent me from messing up with the website;
I don’t want to be able to book anything on the website.
```

#### 7.0 Nights for which a space has already been booked should not be available for users to book that space.
```
User Story 7.1
--------------
As a Host
So that I can prevent overlapping bookings;
I want my properties not to be available if already booked.

User Story 7.2
--------------
As a Guest;
So that I can make sure I am booking an available property;
I want to see on the listing if it is not available.
```

#### 8.0 Until a user has confirmed a booking request, that space can still be booked for that night.
```
User Story 8.1
--------------
As a Host;
So that I can manage multiple requests for the same date;
I want to be able to confirm the booking for the guest of my choice.
```

#### Nice-to-haves
```
As a User;
So that I know my registration was successful;
I’d like to receive a confirmation email upon signing up.

As a Host;
So that I know my listing is online;
I’d like to receive a confirmation email (containing the listing) when I create the new listing.

As a Host;
So that I know that my listing has changed;
I’d like to receive a confirmation email (containing the amended details) when I update a listing.

As a Host;
So that I am made aware of a guest’s enquiry;
I would like to receive an email containing the request.

As a Guest;
So that I know that my booking enquiry was sent to the Host;
I’d like to receive a confirmation email when I contact.

As a Guest;
So that I know that my booking request was successful;
I’d like to receive a confirmation email when the Host confirms my booking.

As a Guest;
So that I know that my booking request was unsuccessful;
I’d like to receive a confirmation email if the Host rejects my booking.
```
