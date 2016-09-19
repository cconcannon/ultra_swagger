# README

## Ultra Swagger

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

## Product Reviews
Ultra Swagger at it's core is a gear review site. Unlike most other gear review sites, however, Ultra Swagger requires that users tag their gear reviews with ultra-endurance events in which that gear was used. This association, along with the user's average weekly running figures, allows Ultra Swagger to sort reviews according to weather, temperatures, or user abilities, in addition to a subjective "1-10" scale overall rating submitted by the user. 