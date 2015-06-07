# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paint_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "paint_cli"
  spec.version       = PaintCli::VERSION
  spec.author        = "Tommaso Pavese"
  spec.email         = "tommaso@pavese.me"
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/tompave/paint_cli"
  
  short_description  = "A very simple command line bitmap editor (for extremely small bitmaps)"
  spec.summary       = short_description
  spec.description   = short_description

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "nothing, to not be published"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "minitest-reporters", '~> 1.0'
  spec.add_development_dependency "pry", "~> 0.10"
end
