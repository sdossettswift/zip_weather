# DEV DIARY

4.5.2018
- Set up empty rails app
- Created Readme with detailed specs, basic user story
- Added Rspec gem to test/development gem group
- Checked out OpenWeatherMap API documentation
- Created account, received API key
- *TODO*: Weigh options for keeping key encrypted. Previously used Figaro gem or added keys to .env files declared in .gitignore file. Apparently, there is a new approach baked into Rails 5.1
- Might as well deploy app to Heroku instance to have working demo. * Will have something to send to grandmother and make her proud ;) * While I'm at it, it is easy enough to set up CI/deployment via Travis.
- As far as UI/UX goes, I don't want to make it too complicated. I do want it to be user-friendly. To that end:
  - Mobile first design
  - Minimal design
  - Background color/spectrum
  - White text (high contrast), use of icons
    - OS icon options:
      - [Weather Iconic - Jackd248](https://github.com/jackd248/weather-iconic)
      - [Weather Icons - Erik Flowers](http://erikflowers.github.io/weather-icons/)
        - compatible w/ OpenWeatherMap API - mappings [here](http://erikflowers.github.io/weather-icons/api-list.html)
  - Framework? Bootstrap would be simple enough, perhaps overkill
- setup Rspec by running  `rails generate rspec:install` command

4.9.2018
- APP PLAN:
  - Root page: Weather#Index
    - there will be a form to enter zip; post to /locate
    - app will dispatch API call passing zip as query parameter
    - api will return JSON object
    - will create @entry w/ data from JSON object
    - redirect

4.10
- notes:
  - (done)temp is in kelvin -> need to display F (fixed by passing imperial unit w/ api call)
  - figure out what's wrong w/ wind direction/wind_speed (fixed-- need to convert deg -> cardinal direction)
  -(done) look into tucking api key away -> look back @ Figaro setup b/c  key isn't being passed in API call
  - create session, add current_location to session data; display current conditions if session data exists
