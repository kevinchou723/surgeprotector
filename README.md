SurgeProtector
==============

SurgeProtector allows users to visualize Uber surge pricing changes over time.

* the app is deployed on Heroku [surgeprotector.herokuapp.com](http://surgeprotector.herokuapp.com/)

* the code is here on GitHub [github.com/PAUCHOU/surgeprotector](https://github.com/PAUCHOU/surgeprotector)

## Contributors

* [Kevin Chou](https://github.com/PAUCHOU)
* [Cameron Jacoby](https://github.com/cameronjacoby)
* [Alex Shevchenko](https://github.com/alexshev91)
* [Lisa Vogt](https://github.com/lisavogtsf)

## Description



SurgeProtector lets visitors browse historic Uber surge pricing data from [Uber's API](https://developer.uber.com/). Our site also allows registered users to save specific locations and track Uber surge pricing for those spots.

The motivation for this project is provide transparent surge pricing data to predict the liklihood of future surges.

In addition, this project fulfills the [requirements for the second project](https://github.com/wdi-sf-july/project_specs) in the General Assembly Web Development Immersive.

## Built With

* Uber API
* Ruby on Rails
* JavaScript
* jQuery
* PostgreSQL
* Chart.js
* Ruby Geocoder
* Ajax

## Wireframes
This wireframe shows our design concept for the front page:
![front page wireframe](/app/assets/images/surgeprotector_wireframe.png "Front page wireframe")

This is an earlier surge meter concept we tried out:
![early red/green surge meter](/app/assets/images/surge_meter_WedAM.png "Early Surge Meter")
## User Stories/Site Flow

## Entity Relationship Diagram
This basic whiteboard drawing depicts the main relationships in our database. One user has many price_queries, and one price query has many price_results. There are some price queries that belong to no user, but that doesn't cause any problems. 

![minimal_ERD](/app/assets/images/minimal_ERD.png "Minimal ERD")

This whiteboard depicts a stage where we considered having a cities table, an idea we abandoned.  This image also shows the attributes we planned to use with our tables. Notes at upper right are for geocoding addresses supplied by users, as the Uber API requires start and end latitude and longitude information.
![early ERD with attributes](/app/assets/images/early_ERD_with_properties.png "early ERD with attributes")


## Wishlist

* Oauth--this would open up many additional options for using the Uber API
** Let users login using Uber credentials
** Add "call to action" button, allowing users to jump directly to Uber's app'
** browse Uber history, suggest places users might want to save and monitor based on their history
** add additional query types, ability to know average wait time for an Uber at different times of day
* Add photos via Instagram API, of origin or destination, so people can preview their route
* Automatically get user's location 