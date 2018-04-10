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
- 
