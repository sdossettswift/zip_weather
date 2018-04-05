# Relevant [OpenWeatherMap API Docs](https://openweathermap.org/current)

### By ZIP code

Description:
- Please note if country is not specified then the search works for USA as a default.

API call:
- `api.openweathermap.org/data/2.5/weather?zip={zip code},{country code}`

Example API call :
 - [api.openweathermap.org/data/2.5/weather?zip=94040,us](api.openweathermap.org/data/2.5/weather?zip=94040,us)

Parameters:
- zip

Response:
``` JSON
{"coord":{"lon":-122.09,"lat":37.39},
"sys":{"type":3,"id":168940,"message":0.0297,"country":"US","sunrise":1427723751,"sunset":1427768967},
"weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],
"base":"stations",
"main":{"temp":285.68,"humidity":74,"pressure":1016.8,"temp_min":284.82,"temp_max":286.48},
"wind":{"speed":0.96,"deg":285.001},
"clouds":{"all":0},
"dt":1427700245,
"id":0,
"name":"Mountain View",
"cod":200}
```
