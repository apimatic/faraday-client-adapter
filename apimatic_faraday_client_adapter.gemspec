Gem::Specification.new do |s|
  s.name = 'apimatic_faraday_client_adapter'
  s.version = '0.1.0'
  s.summary = 'An adapter for faraday client library consumed by the SDKs generated with APIMatic.'
  s.description = 'Faraday is a simple, yet elegant, HTTP library. This repository contains the client '\
                  'implementation that uses the requests library for python SDK provided by APIMatic.'
  s.authors = ['APIMatic']
  s.email = 'support@apimatic.io'
  s.homepage = 'https://apimatic.io'
  s.license = 'APIMATIC REFERENCE SOURCE LICENSE'
  s.add_dependency('apimatic_core_interfaces', '~> 0.1.0')
  s.add_dependency('faraday', '~> 2.0', '>= 2.0.1')
  s.add_dependency('faraday-follow_redirects', '~> 0.2')
  s.add_dependency('faraday-multipart', '~> 1.0')
  s.add_dependency('faraday-gzip', '~> 0.1')
  s.add_dependency('faraday-retry', '~> 1.0')
  s.add_dependency('faraday-net_http_persistent', '~> 2.0')
  s.add_dependency('certifi', '~> 2018.1', '>= 2018.01.18')
  s.add_dependency('faraday-http-cache', '~> 2.2')
  s.add_development_dependency('minitest', '~> 5.14', '>= 5.14.1')
  s.add_development_dependency('minitest-proveit', '~> 1.0')
  s.add_development_dependency('simplecov', '~> 0.21.2')
  s.required_ruby_version = ['>= 2.6']
  s.files = Dir['{lib, test}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end