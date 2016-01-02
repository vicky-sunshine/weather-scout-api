# WeatherScout Webservice

A simple version of web service that scrapes [Central Web Bureau][1] data using the
[weatherscout][2] gem

## API using example

**GET /**
- returns OK status to indicate service is alive
- tells us the current API version and Github homepage of API
- example:
```sh
# it will return the basic information of weather scout
$ curl -GET http://127.0.0.1:9292/
Hello, This is Weather Scout service. Current API version is v1. See Homepage <a href="https://github.com/vicky-sunshine/weather-scout-api">Github repo</a>
```

**POST /api/v1/daily_weather**
- takes JSON: city we want to search
- returns: weather information of the city
- example:
```sh
# it will return the weather information of the city
$ curl -H "Content-Type: application/json" -X POST -d '{"city":"Hsinchu"}' http://127.0.0.1:9292/api/v1/daily_weather
{"city":"Hsinchu_City","date":"01/02","temperature_day":"17 ~ 18","temperature_night":"17 ~ 21","condition_day":"多雲時陰短暫雨","condition_night":"陰時多雲短暫雨","rain_probability":"60 %","tips":"白天東北季風減弱，晚起南方雲系北移有短暫雨\n昨(1)日，新竹市地區清晨東北季風影響，早晚氣溫低，，溫度在15.9到22.7度之間。\n今(2)日，白天東北季風減弱新竹地區為多雲，晚起南方雲系北移轉有短暫雨，氣溫18-21度，早晚注意保暖，晚上外出請帶雨具，空曠地區有強陣風請注意。\n今(2)日臺灣北部海面，早上起有風變，由偏南風轉偏北風，船隻請注意。\n"}
```

[1]:http://www.cwb.gov.tw/V7/index.htm
[2]:https://github.com/vicky-sunshine/weather-scout-scraper

# For development

After clone this repository, use `bundle` to install all dependences

```sh
$ bundle install
```

Use `rackup` to run the web app, and visit [http://localhost:9292](http://localhost:9292/)

```sh
$ rackup
Thin web server (v1.6.4 codename Gob Bluth)
Maximum connections set to 1024
Listening on localhost:9292, CTRL+C to stop
```

Run testing

```sh
$ rake
```
