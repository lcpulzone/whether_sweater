[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



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
    <a href="https://github.com/lcpulzone/whether_sweater"><strong>Explore the docs »</strong></a>
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
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
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

* [Ruby on Rails](https://rubyonrails.org/)




<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* Rails 5.2.6
* Ruby 2.7.2
* API from [Open Weather](https://openweathermap.org/appid)

* API from [Map Quest](https://developer.mapquest.com/)

* API from [Unsplash](https://unsplash.com/developers)

### Installation

1. Fork & clone this repo

2. Run `bundle install` to install gem packages

3. Run `rails db:{drop,create,migrate}` to set up the database

4. Run `bundle exec figaro install` then add your API keys to the `config/application.yml` file as:
`OW_API_KEY` for Open Weather,
`MQD_API_KEY` for Map Quest, and
`UN_API_KEY` for Unsplash

5. Run `rails s` and navigate to [localhost:3000](http://localhost3000) to consume Whether, Sweater's API endpoints


<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/lcpulzone/whether_sweater/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->
## Contact

Leigh Cepriano Pulzone - Twitter:  [@lcpulzone](https://twitter.com/lcpulzone) - Email: lcpulzone@gmail.com

Project Link: [https://github.com/lcpulzone/whether_sweater](https://github.com/lcpulzone/whether_sweater)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* []()
* []()
* []()





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
