# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dubliner'

Gem::Specification.new do |spec|
  spec.name          = 'dubliner'
  spec.version       = Dubliner::VERSION
  spec.authors       = ['Chinmaya Dattathri']
  spec.email         = ['d.chinmaya@gmail.com']

  spec.summary       = "Find cool folks for your party who don't end up crashing at your place."
  spec.description   = "Find cool folks for your party who don't end up crashing at your place."
  spec.homepage      = 'https://github.com/dchinmaya/dubliner'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  unless spec.respond_to?(:metadata)
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.3'
end
