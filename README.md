SurgeProtector
==============

SurgeProtector allows users to visualize Uber surge pricing changes over time.

* the code is here on GitHub [github.com/PAUCHOU/surgeprotector](https://github.com/PAUCHOU/surgeprotector)

* the app is deployed on Heroku [surgeprotector.herokuapp.com](http://surgeprotector.herokuapp.com/) 

## Contributors

* [Kevin Chou](https://github.com/PAUCHOU)
* [Cameron Jacoby](https://github.com/cameronjacoby)
* [Alex Shevchenko](https://github.com/alexshev91)
* [Lisa Vogt](https://github.com/lisavogtsf)

## Description



SurgeProtector lets visitors browse historic Uber surge pricing data from [Uber's API](https://developer.uber.com/). Our site also allows registered users to save specific locations and track Uber surge pricing for those spots.

The motivation for this project is provide transparent surge pricing data to predict the liklihood of future surges. Uber is a company that connects drivers and passengers with smartphone technology. When demand for rides is high, Uber increases its surge multiplier from 1 to 1.25, 2.0, even up to 5.0 or 7.0 in extreme cases. While passengers enjoy the convenience of Uber, the added cost of surge pricing can make the service frustrating to use.  SurgeProtector helps Uber users avoid surge pricing.

In addition, this project fulfills the [requirements for the second project](https://github.com/wdi-sf-july/project_specs) in the General Assembly Web Development Immersive.

## Built With

* Uber API
* Ruby on Rails
* JavaScript
* jQuery
* PostgreSQL
* Ajax
* Chart.js
* Ruby Geocoder
* Google Maps API


## Wireframes
This wireframe shows our design concept for the front page:
![front page wireframe](/app/assets/images/surgeprotector_wireframe.png "Front page wireframe")

This is an earlier surge meter concept we tried out:
![early red/green surge meter](/app/assets/images/surge_meter_WedAM.png "Early Surge Meter")

## User Stories
As an Uber user I want to know when price surges occur so that I can plan around them. From the Uber app I can already find out the surge price at any moment, but with SurgeProtector I can track the timing of surges from the past. Then I can plan to contact Uber before a regular price surge begins (morning commute, evening commute, late night after last call).

I can also save specific location information for the places I user Uber most, as surge pricing may be different for that neighborhood than for the entire city.

## Wishlist


* Accumulate more data to provide a more complete history
* Handle large amounts of data more quickly, so our graphs don't slow down for large requests
* Show more-detailed data, ie 10 or 15-minute intervals
* Provide clearer prediction services, noting the average start time of surges, possibly notifying users by email or text before a surge is expected to start
* Add photos via Instagram API, of origin or destination, so people can preview their route
* Automatically get user's location to show them local results first
* Offer more types of queries, such as the estimated amount of time it takes for an Uber to arrive at a certain location, tracked over time, again giving more predictive power
* Oauth would open up many additional options for using the Uber API
  * Let users login using Uber credentials, access their Uber profile information
  * Search a user's Uber history and suggest places users might want to save and monitor based on their history
  * Add "call to action" button, allowing users to jump directly to Uber's app'
  
## Addendum: Uber Privacy Policy
Due to a change in the Uber Privacy Policy required for access to the API and the completion of our Web Development Immersive at General Assembly we are no longer gathering new data for SurgeProtector.  As a result new users will not be able to get information on their selected places. 

SurgeProtector continues to display surge pricing data from August and September 2014 in the following cities:

* San Francisco
* New York
* Los Angeles
* Seattle
* London
* Hong Kong
* Melbourne
* Sydney
* Jacksonville
