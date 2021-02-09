# README

view the app at at http://ultraswagger.herokuapp.com

## Ultra Swagger

### Startup
```git clone https://github.com/cconcannon/ultra_swagger.git```
```cd ultra_swagger```

to proceed, ruby must be installed on your local machine

if bundle is not installed: ```gem install bundler```

```bundle install```

```rails s```

### Introduction
Ultra Swagger was created as a self-directed project for module 3 of the back-end program at the Turing School of Software and Design. The technical expectations of the project were:
* use an external OAuth provider to authenticate users
* consume an external API
* implement a production-quality user interface
* optimize the application through the database structure, caching, using background workers, and sending AJAX requests

## OAuth
Ultra Swagger uses Strava to authenticate with OAuth using the OmniAuth gem. 

## API calls
Ultra Swagger consumes Strava.com's API. When an athlete logs in to the application, the athlete's YTD totals are retrieved from Strava.com. These data are then analyzed to determine the average weekly distance, time, and elevation gained for the athlete's running events. The distance and time are used to calculate the athlete's average speed. 

Ultra Swagger consumes the Google Geocoding API. When a user submits a review to the application, that review has two items associated with user inputs - an item, and a race. The race has a location input field. The Geocoding API looks up the latitude and longitude of the race location based on the user's input, and assigns those numbers as attributes on the race object. 

Ultra Swagger consumes the Dark Sky API. Using the attributes of date, latitude, and longitude (from the Geocoding API), the Dark Sky API is used to look up historical weather details for the date and location of a race event. Some of those details (min temp, max temp, and climate description) are stored as attributes on the race object. 

## Product Reviews
Ultra Swagger at it's core is a gear review site. Unlike most other gear review sites, however, Ultra Swagger requires that users tag their gear reviews with ultra-endurance events in which that gear was used. This association, along with the user's average weekly running figures, allows Ultra Swagger to associate reviews with weather, temperatures, distance, or user abilities. The user is also asked to submit a "1-10" overall rating and provide comments in their review. 

The site in future versions will likely incorporate other methods of sorting reviews, such as by best performance in hot or cold temperatures, or worst performance in rain. 
