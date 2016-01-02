# WeatherScout Webservice

A simple version of web service that scrapes [Central Web Bureau][1] data using the
[weatherscout][2] gem

Handles:
- GET   /
  - returns OK status to indicate service is alive
- POST  /api/v1/daily_weather
  - takes JSON: city we want to search
  - returns: weather information of the city

[1]:http://www.cwb.gov.tw/V7/index.htm
[2]:https://github.com/vicky-sunshine/weather-scout-scraper
