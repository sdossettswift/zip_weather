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
4.10 Morning light!
- Implemented bootstrap in a new branch. Brought in a google font. Broke components out into partials.
- It occurred to me that this is not a very rails-y way to do things. Previously, I was thinking of a super simple approach I have taken before (coffeeLocator, for example) -- but this data did not persist to a db. As such, we used simple form_tags, not a rails form_for, etc.
- Created Entries Controller, re-did route in attempt to lean further into the Rails way ;)
- Set up model method to convert degrees into cardinal directions; wrote specs to verify
- Added @current_location to session data; added button to reset session data (and therefore reset current location)
- Added additional scope to @entries to prevent incomplete entries from showing up in history
- I realized that by moving away from the WeatherController w/ the locate button, what I really did was jump to create an entry w/out first having received the desired payload, or even a successful zip validation. The model validations for zip length and format do a good job at weeding out malformed zip codes; however, when a 5-digit zip-code lookalike that isn't sanctioned by the US post office... that's where things fall apart. For the purposes of displaying only valid @entries, I implemented a scope called "has_city". If the entry does not have a value for city, it is not a complete record, and should not appear in the results. This is imperfect. What I really need is to not create an entry until I get a complete API response.
- Instead of scrapping this and going back to the previous approach, I can satisfy the requirements by failing gracefully, and redirecting to a form w/ error messages displayed.
- I also set up TravisCI and Heroku to manage CI testing and deployment. Upon a successful TravisCI build, fresh code will be deployed to Heroku.
- In order to protect the API key, I ended up using Figaro and Dotenv. My API key is where it needs to be for the sake of deployment, but it is not in source control.
