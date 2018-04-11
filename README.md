# README
![Travis CI](https://travis-ci.org/sdossettswift/zip_weather.svg?branch=master)
## ZipWeather: Current Weather Conditions for Your Zip Code
### Criteria
- Rails App
- Consume data via [OpenWeatherMap API](https://openweathermap.org)
- PostgreSQL database
- Rspec test suite
- Error tolerance
- Weather data written to database

### User Story
- User goes to home page
- User sees form with zip code and a submit button
- User enters zip code
- User clicks submit button
- Page displays current weather conditions
- Page additionally displays previous 5 weather measurements w/ zipcode

### Display
- Zip code
- General weather conditions (e.g., sunny, rainy, etc.)
- Atmospheric pressure
- Temperature (F)
- Wind (direction + speed)
- Humidity
- UTC Timestamp

## Documentation
- Setup instructions: This assumes you are set up with Rails, Ruby, PostgreSQL
  - Run bundle to install dependencies `bundle`
  - Create database `rails db:create`
  - Run test suite `rspec spec` || `rake`
  - Start Server `rails s`

- You can also check out the Heroku instance [here](https://zip-weather.herokuapp.com/)
- TravisCI build info available [here](https://travis-ci.org/sdossettswift/zip_weather)
- Code is available on github [here](https://github.com/sdossettswift/zip_weather)
