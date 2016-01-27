# WeatherScout Webservice
[ ![Codeship Status for weatherscout-api](https://codeship.io/projects/a23b58c0-5dc5-0133-8052-3a8f5e5e1065/status?branch=master)](https://codeship.com/projects/124805)


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
- takes JSON: city we want to search, ex: `{"city":"Hsinchu"}`
- returns: weather information of the city
- example:
```sh
# it will return the weather information of the city today
$ curl -H "Content-Type: application/json" -X POST -d '{"city":"Hsinchu"}' http://127.0.0.1:9292/api/v1/daily_weather
{"city":"HsinchuCity","weathers":{"今晚至明晨 01/28 00:00~01/28 06:00":{"temperature":"15 ~ 17","rain_probability":"50 %","condition":"多雲短暫陣雨"},"明日白天 01/28 06:00~01/28 18:00":{"temperature":"15 ~ 20","rain_probability":"80 %","condition":"陰時多雲陣雨"},"明日晚上 01/28 18:00~01/29 06:00":{"temperature":"16 ~ 17","rain_probability":"80 %","condition":"多雲時陰陣雨"}},"tips":"鋒面影響，陰時多雲陣雨\n今 (27)日，新竹市地區受華南雲系東移影響部分地區上午有短暫降雨，氣溫稍回升，香山區溫度在12-19度間。入夜後降雨機會增加溫度稍低，外出請注意保暖和攜帶雨具。\n明 (28)日，新竹市地區受鋒面影響降雨機會增加，天氣為陰時多雲陣雨，預報氣溫16到20度。外出請注意保暖和攜帶雨具。\n明 (28)日，新竹沿海平均風力5至6陣風8級，船隻請注意。\n"}
```

**POST /api/v1/weekly_weather**
- takes JSON: city we want to search, ex: `{"city":"Hsinchu"}`
- returns: weather information of the city in the future week
- example:
```sh
# it will return the weather information of the city in the future week
$ curl -H "Content-Type: application/json" -X POST -d '{"city":"Hsinchu"}' http://127.0.0.1:9292/api/v1/weekly_weather
{"city":"HsinchuCity","weathers":{"01/28星期四":{"day_temperature":"15 ~ 20","day_condition":"陰時多雲陣雨","night_temperature":"16 ~ 17","night_condition":"多雲時陰陣雨"},"01/29星期五":{"day_temperature":"16 ~ 18","day_condition":"多雲時陰陣雨","night_temperature":"15 ~ 16","night_condition":"陰陣雨"},"01/30星期六":{"day_temperature":"15 ~ 16","day_condition":"多雲時陰陣雨","night_temperature":"14 ~ 15","night_condition":"多雲時陰陣雨"},"01/31星期日":{"day_temperature":"14 ~ 17","day_condition":"多雲時陰短暫雨","night_temperature":"14 ~ 15","night_condition":"陰短暫雨"},"02/01星期一":{"day_temperature":"14 ~ 17","day_condition":"多雲時陰短暫雨","night_temperature":"14 ~ 16","night_condition":"多雲短暫雨"},"02/02星期二":{"day_temperature":"14 ~ 17","day_condition":"陰時多雲短暫雨","night_temperature":"14 ~ 16","night_condition":"多雲時陰短暫雨"},"02/03星期三":{"day_temperature":"14 ~ 17","day_condition":"多雲時陰短暫雨","night_temperature":"14 ~ 16","night_condition":"多雲短暫雨"}}}
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
