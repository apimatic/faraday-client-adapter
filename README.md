# apimatic-faraday-client-adapter

[![Gem Version](https://badge.fury.io/rb/apimatic_faraday_client_adapter.svg)](https://badge.fury.io/rb/apimatic_faraday_client_adapter)
[![Tests][test-badge]][test-url]
[![Linting][lint-badge]][lint-url]
[![Maintainability][maintainability-url]][code-climate-url]
[![Test Coverage][test-coverage-url]][code-climate-url]
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
[![Licence][license-badge]][license-url]

## Introduction
This repository contains the client implementation that uses the faraday client library for the ruby SDKs provided by APIMatic.

## Version supported
Currently APIMatic supports  `2.6 <= Ruby version < 3.1`  hence faraday-client-adapter will need the same versions to be supported.

## Installation
Installation is quite simple, just execute the following command:
```
gem install apimatic_faraday_client_adapter
```

If you'd rather install apimatic_faraday_client_adapter using bundler, add a line for it in your Gemfile:
```
gem 'apimatic_faraday_client_adapter'
```

## Classes
| Class                                                                                | Description                                                                                        |
|--------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| [`FaradayClient`](lib/apimatic-faraday-client-adapter/faraday_client.rb)             | Executes an HttpRequest and converts the HTTP Response from the client to an HttpResponse object.  |


## Methods
| Method                                                                         | Description                                   |
|--------------------------------------------------------------------------------|-----------------------------------------------|
| [`create_connection`](lib/apimatic-faraday-client-adapter/faraday_client.rb)   | Initiates a new connection for executing the HTTP calls            |
| [`execute`](lib/apimatic-faraday-client-adapter/faraday_client.rb)             | Executes request with the properties set                           |
| [`convert_response`](lib/apimatic-faraday-client-adapter/faraday_client.rb)    | Converts the Response from the HTTP client into HttpResponse object|

## Links

* [apimatic_core_interfaces](https://rubygems.org/gems/apimatic_core_interfaces)
* [Faraday](https://rubygems.org/gems/faraday)

[test-badge]: https://github.com/apimatic/faraday-client-adapter/actions/workflows/test-runner.yml/badge.svg
[test-url]: https://github.com/apimatic/faraday-client-adapter/actions/workflows/test-runner.yml
[lint-badge]: https://github.com/apimatic/faraday-client-adapter/actions/workflows/lint-runner.yml/badge.svg
[lint-url]: https://github.com/apimatic/faraday-client-adapter/actions/workflows/lint-runner.yml
[code-climate-url]: https://codeclimate.com/github/apimatic/faraday-client-adapter
[maintainability-url]: https://api.codeclimate.com/v1/badges/59badaadebeb3478eb48/maintainability
[test-coverage-url]: https://api.codeclimate.com/v1/badges/59badaadebeb3478eb48/test_coverage
[license-badge]: https://img.shields.io/badge/licence-APIMATIC-blue
[license-url]: LICENSE
