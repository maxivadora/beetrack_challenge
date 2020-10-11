# Beetrack challenge!

There is a [demo](https://beetrack-challange.herokuapp.com/show) in Heroku.

## Preparation
* ruby-2.7.0
* rails (6.0.3.3)
* postgresql 12
* yarn 1.22.5
* docker 19.03.12
* docker-compose 1.26.2
* rspec-core 3.9

### Envirment variables
```
DB_PASSWORD=
DB_USER=
DB_HOST=
WEBPACKER_SERVER_HOST=
GOOGLE_MAP_KEY=
```

## Installation and run project with docker

Clone this repository.
````
$ git@github.com:maxivadora/beetrack_challenge.git
$ cd beetrack_challenge
````
Up docker container.
```
$ docker-compose up --build
```
Initialize database and seed data.
```
$ docker-compose exec rails rake db:create db:migrate db:seed
```
Open in browser
```
http://localhost:3000/show
```

Run specs
```
$ docker-compose run app rspec .
```

## API Doc
Add position by vehicle.
```
POST /api/v1/gps
headers:
    Content-Type: application/json
params:
{
  "latitude": 20.23,
  "longitude": -0.56,
  "sent_at": 2016-06-02 20:45:00",
  "vehicle_identifier": "HA-3452"
}
```