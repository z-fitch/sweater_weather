# Whether, Sweater?  - Project README

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).


## Github Setup

1. Fork the repository.
2. Clone to your machine
2. Create a new branch for your endpoint: `git checkout -b <your-feature>`
3. Commit your changes: `git commit -m "Add new feature"`
4. Push the branch to your fork: `git push origin your-feature`
5. Create a pull request outlining your changes.

## Repo Setup

1.  run: `bundle install`
2.  If you have the master key, create: `touch config/master.key`, and put it at the top
3.  IF you don't, delete the credentials.yml.enc file and run: `EDITOR="code --wait" rails credentials:edit`, fill in your information and then close the file to save.
    - this file should be set up like this
      ```
      weather:
        api_key: REPLACE_WITH_YOUR_KEY

      map_quest:
        api_key: REPLACE_WITH_YOUR_KEY

      ```
    - You can get a weather API key by going to https://www.weatherapi.com/, creating an account and going to your dashboard
    - You can get a map_quest key by going to https://developer.mapquest.com/, creating an account and going to your profile
4. run: `rails db:{drop,create,migrate}`
4. run: `bundle exec rspec` (all tests will pass if set up was done correctly) 

## Endpoints

1. `GET /api/v0/forecasts?location=#{location}`
  - EX: `/api/v0/forecasts?location=denver,co`

  ```{
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "last_updated": "2023-09-26 21:30",
                "temperature": 61.9,
                "feels_like": 61.9,
                "humidity": 34,
                "uvi": 1.0,
                "visibility": 9.0,
                "condition": "Partly cloudy",
                "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png"
            },
            "daily_weather": [
                {
                    "date": "2023-09-26",
                    "sunrise": "06:51 AM",
                    "sunset": "06:51 PM",
                    "max_temp": 86.2,
                    "min_temp": 52.5,
                    "condition": "Sunny",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
                },
                {1..4}
            ],
            "hourly_weather": [
                {
                    "time": "00:00",
                    "temperature": 63.3,
                    "condition": "Clear",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
                },
                {
                    "time": "01:00",
                    "temperature": 66.0,
                    "condition": "Clear",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
                },
                {2..23}
            ]
        }
    }
}
```

2. `POST /api/v0/users` *send user creation info in the body of the response
  - EX: `/api/v0/users` 

```
        body = { 
          "email": "fakeemailhere@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        body_create = JSON.generate(body)
```

```
{
    "data": {
        "id": "400",
        "type": "user",
        "attributes": {
            "email": "fakeemailhere@example.com",
            "api_key": "igotageneratoredapikeyback!!!"
        }
    }
}
```

3. `POST /api/v0/sessions`
  - EX: `/api/v0/sessions` 

```
        body = {
          "email": "fakeemailhere@example.com",
           "password": "password"
        }
        body_create = JSON.generate(body)
```

```
{
    "data": {
        "id": "8",
        "type": "user",
        "attributes": {
            "email": "fakeemailhere@example.com",
            "api_key": "heyitreturnedthesameoneigotearlier!"
        }
    }
}
```
4. `POST /api/v0/road_trip`
  - EX: `/api/v0/road_trip` 

```
        body = {
          "origin": "Cincinatti,OH",
          "destination": "Chicago,IL",
          "api_key": user_api_key_here
        }
        body_create = JSON.generate(body)
```

```
{
    "data": {
        "id": "null",
        "type": "road_trip",
        "attributes": {
            "start_city": "Cincinatti,OH",
            "end_city": "Chicago,IL",
            "travel_time": "04:21:15",
            "weather_at_eta": {
                "datetime": "2023-09-27 02:39",
                "temperature": 65.3,
                "condition": "Clear"
            }
        }
    }
}
```