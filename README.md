<div align="center">
  <a href=https://github.com/lcpulzone/whether_sweater/graphs/contributors><img src="https://img.shields.io/github/contributors/lcpulzone/whether_sweater.svg?style=for-the-badge" /></a>
  <a href=https://github.com/lcpulzone/whether_sweater/network/members><img src="https://img.shields.io/github/forks/lcpulzone/whether_sweater.svg?style=for-the-badge" /></a>
  <a href=https://github.com/lcpulzone/whether_sweater/stargazers><img src="https://img.shields.io/github/stars/lcpulzone/whether_sweater.svg?style=for-the-badge" /></a>
  <a href=https://github.com/lcpulzone/whether_sweater/issues><img src="https://img.shields.io/github/issues/lcpulzone/whether_sweater.svg?style=for-the-badge" /></a>
<a href=https://www.linkedin.com/in/lcpulzone/><img src="https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555" /></a>
</div>


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/lcpulzone/whether_sweater">
  </a>

  <h3 align="center">Whether, Sweater</h3>

  <p align="center">
    This is a back-end application that exposes API's to support building an application that to plan road trips.  <br>
    The API's exposed will allow front-end developers to show users the current weather as well as the forecasted weather when they arrive at their destination.
    <br />
    <a href="https://github.com/lcpulzone/whether_sweater">
    <a href="https://github.com/lcpulzone/whether_sweater/issues">Report Bug</a>
    ·
    <a href="https://github.com/lcpulzone/whether_sweater/issues">Request Feature</a>
    <br />
    <br />
    <br />
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#endpoints">Endpoints</a></li>
    <ul>
      <li><a href="#retrieve-weather-for-a-city">Retrieve weather for a city</a></li>
      <li><a href="#background-image-for-a-city">Background image for a city</a></li>
      <li><a href="#user-registration">User registration</a></li>
      <li><a href="#login">Login</a></li>
      <li><a href="#road-trip">Road Trip</a></li>
    </ul>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Whether, Sweater is a fictional back-end application built to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

The front-end communicated with back-end through an API.

The goal of this project was to work in a service-oriented architecture to expose an API that satisfied the front-end team’s requirements.

### Main learning goals:
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

### Built With

[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)<br />
![tested with rspec](https://github.com/lcpulzone/tea_time/blob/main/tested-with-rspec.svg)/)


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

[Rails 5.2.6](https://rubyonrails.org/)<br />
[Ruby 2.7.2](https://www.ruby-lang.org/en/)
* API from [Open Weather](https://openweathermap.org/appid)

* API from [Map Quest](https://developer.mapquest.com/)

* API from [Unsplash](https://unsplash.com/developers)

### Installation

To get a local copy up and running follow these simple steps.

1. Fork & clone this repo

2. Run `bundle install` to install gem packages

3. Run `rails db:{drop,create,migrate}` to set up the database

4. Run `bundle exec figaro install` then add your API keys to the `config/application.yml` file as:
`OW_API_KEY` for Open Weather,
`MQD_API_KEY` for Map Quest, and
`UN_API_KEY` for Unsplash

5. Run `rails s` and navigate to [localhost:3000](http://localhost3000) to consume Whether, Sweater's API endpoints


<!-- USAGE EXAMPLES -->
## Endpoints

### Retrieve weather for a city
- **Request** `GET /api/v1/forecast?location=<location>`

- *Sample Request:*

  `GET /api/v1/forecast?location=bend,or`

- *Sample Response:*
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "September 05, 11:05 AM -0600",
                "sunrise": "September 05, 07:33 AM -0600",
                "sunset": "September 05, 08:34 PM -0600",
                "temperature": 70.38,
                "feels_like": 68.47,
                "humidity": 29,
                "uvi": 3.09,
                "visibility": 1609,
                "conditions": "haze",
                "icon": "50d"
            },
            "daily_weather": [
                {
                    "date": "September 05, 2021",
                    "sunrise": "September 05, 07:33 AM -0600",
                    "sunset": "September 05, 08:34 PM -0600",
                    "max_temp": 89.8,
                    "min_temp": 53.22,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "September 06, 2021",
                    "sunrise": "September 06, 07:34 AM -0600",
                    "sunset": "September 06, 08:32 PM -0600",
                    "max_temp": 88.25,
                    "min_temp": 52.95,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "September 07, 2021",
                    "sunrise": "September 07, 07:35 AM -0600",
                    "sunset": "September 07, 08:30 PM -0600",
                    "max_temp": 95.61,
                    "min_temp": 57.45,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "September 08, 2021",
                    "sunrise": "September 08, 07:36 AM -0600",
                    "sunset": "September 08, 08:29 PM -0600",
                    "max_temp": 85.01,
                    "min_temp": 55.42,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "September 09, 2021",
                    "sunrise": "September 09, 07:38 AM -0600",
                    "sunset": "September 09, 08:27 PM -0600",
                    "max_temp": 86.2,
                    "min_temp": 52.07,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "11:00 AM",
                    "temperature": 70.38,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "12:00 PM",
                    "temperature": 72.41,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "01:00 PM",
                    "temperature": 75.96,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "02:00 PM",
                    "temperature": 80.37,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "03:00 PM",
                    "temperature": 85.26,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "04:00 PM",
                    "temperature": 89.8,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "05:00 PM",
                    "temperature": 88.36,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "06:00 PM",
                    "temperature": 86.43,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ]
        }
    }
}
```

### Background image for the city
- **Request** `GET /api/v1/backgrounds?location=<location>`

- *Sample Request:*

  `GET /api/v1/forecast?location=bend,or`

- *Sample Response:*
```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "location": "bend,or",
            "description": "Horseshoe Bend during daytime",
            "image_urls": {
                "raw": "https://images.unsplash.com/photo-1483086451546-5a971a934123?ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1483086451546-5a971a934123?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1&q=85",
                "regular": "https://images.unsplash.com/photo-1483086451546-5a971a934123?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1483086451546-5a971a934123?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1483086451546-5a971a934123?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NzN8MHwxfHNlYXJjaHwxfHxiZW5kJTJDb3J8ZW58MHx8fHwxNjMwODYxNTAy&ixlib=rb-1.2.1&q=80&w=200"
            },
            "credit": {
                "name": "Des Récits",
                "self": "https://api.unsplash.com/users/desrecits",
                "html": "https://unsplash.com/@desrecits",
                "photos": "https://api.unsplash.com/users/desrecits/photos",
                "portfolio": "https://api.unsplash.com/users/desrecits/portfolio"
            }
        }
    }
}
```

### User Registration
- **Request** `POST /api/v1/users`

- *Sample Request:*

  ```
  {
    "email": "missfrizbeethemouse@pets.com",
    "password": "***************ries",
    "password_confirmation":  "***************ries"
  }
  ```

- *Sample Response:*
```
{
    "data": {
        "id": "10",
        "type": "users",
        "attributes": {
            "email": "missfrizbeethemouse@pets.com",
            "api_key": "****************************fO9x"
        }
    }
}
```

### Login
- **Request** `POST /api/v1/sessions`

- *Sample Request:*

  ```
  {
    "email": "tedthedog@pets.com",
    "password": "**************wels"
  }
  ```

- *Sample Response:*
```
{
    "data": {
        "id": "3",
        "type": "users",
        "attributes": {
            "email": "tedthedog@pets.com",
            "api_key": "****************************RPhR"
        }
    }
}
```

### Road Trip
- **Request** `POST /api/v1/road_trip`

- *Sample Request:*

  ```
  {
    "origin": "Denver,CO",
    "destination": "Bend,OR",
    "api_key": "****************************dXIp"
  }
  ```

- *Sample Response:*
```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Bend,OR",
            "travel_time": "16:13:11",
            "weather_at_eta": {
                "temperature": 55.51,
                "conditions": "overcast clouds"
            }
        }
    }
}
```

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/lcpulzone/whether_sweater/issues) for a list of proposed features (and known issues).

<!-- CONTACT -->
## Contact

Leigh Cepriano Pulzone - Twitter:  [@lcpulzone](https://twitter.com/lcpulzone) - Email: lcpulzone@gmail.com

Project Link: [https://github.com/lcpulzone/whether_sweater](https://github.com/lcpulzone/whether_sweater)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Project Board](https://github.com/lcpulzone/whether_sweater/projects/1)

* API from [Open Weather](https://openweathermap.org/appid)

* API from [Map Quest](https://developer.mapquest.com/)

* API from [Unsplash](https://unsplash.com/developers)

* Photographer Attribution [Guidelines](https://help.unsplash.com/en/articles/2511315-guideline-attribution)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/lcpulzone/whether_sweater.svg?style=for-the-badge
[contributors-url]: https://github.com/lcpulzone/whether_sweater/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/lcpulzone/whether_sweater.svg?style=for-the-badge
[forks-url]: https://github.com/lcpulzone/whether_sweater/network/members
[stars-shield]: https://img.shields.io/github/stars/lcpulzone/whether_sweater.svg?style=for-the-badge
[stars-url]: https://github.com/lcpulzone/whether_sweater/stargazers
[issues-shield]: https://img.shields.io/github/issues/lcpulzone/whether_sweater.svg?style=for-the-badge
[issues-url]: https://github.com/lcpulzone/whether_sweater/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/lcpulzone
