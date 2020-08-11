# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/backlog/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-backlog'
  spec.version       = Omniauth::Backlog::VERSION
  spec.authors       = ['mataki']
  spec.email         = ['mat_aki@sonicgarden.jp']

  spec.summary       = 'OmniAuth strategy for Backlog'
  spec.description   = 'OmniAuth strategy for Backlog'
  spec.homepage      = 'https://github.com/SonicGarden/omniauth-backlog'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'omniauth', '> 1.0'
  spec.add_dependency 'omniauth-oauth2', '> 1.3'
end
