# apimatic-faraday-client-adapter

[//]: # ([![PyPI][rubymine-version]][pypi-apimatic-requests-client-adapter-url])
[//]: # ([![Tests][test-badge]][test-url])
[//]: # ([![Maintainability][maintainability-url]][code-climate-url])
[//]: # ([![Test Coverage][test-coverage-url]][code-climate-url])
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
[![Licence][license-badge]][license-url]

## Introduction
This repository contains the client implementation that uses the faraday client library for the ruby SDKs provided by APIMatic.

## Version supported
Currently APIMatic supports  `Ruby version >= 2.6`  hence faraday-client-adapter will need the same versions to be supported.

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
| [`create_connection`](lib/apimatic-faraday-client-adapter/faraday_client.rb)   | Initiates a new connection                    | 
| [`execute`](lib/apimatic-faraday-client-adapter/faraday_client.rb)             | Executes request with the properties set      |

## Links

[//]: # (* [apimatic-core-interfaces]&#40;https://pypi.org/project/apimatic-core-interfaces/&#41;)
* [Faraday](https://rubygems.org/gems/faraday)

[rubymine-version]: https://img.shields.io/pypi/v/apimatic-requests-client-adapter
[rubymine-apimatic-requests-client-adapter-url]: https://pypi.org/project/apimatic-requests-client-adapter/
[test-badge]: https://github.com/apimatic/requests-client-adapter/actions/workflows/building-and-testing.yml/badge.svg
[test-url]: https://github.com/apimatic/requests-client-adapter/actions/workflows/building-and-testing.yml
[code-climate-url]: https://codeclimate.com/github/apimatic/faraday-client-adapter
[license-badge]: https://img.shields.io/badge/licence-APIMATIC-blue
[license-url]: LICENSE