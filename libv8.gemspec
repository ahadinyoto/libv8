# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require "libv8/version"

Gem::Specification.new do |s|
  s.name        = "libv8"
  s.version     = Libv8::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Charles Lowell"]
  s.email       = ["cowboyd@thefrontside.net"]
  s.homepage    = "http://github.com/cowboyd/libv8"
  s.summary     = %q{Distribution of the V8 JavaScript engine}
  s.description = %q{Distributes the V8 JavaScript engine in binary and source forms in order to support fast builds of The Ruby Racer}

  s.rubyforge_project = "libv8"


  s.files  = `git ls-files`.split("\n")
  s.files += Dir.chdir("vendor/v8") do
    `git ls-files`.split("\n").reject {|f| f =~ /^out/}.map {|f| "vendor/v8/#{f}"}
  end

  s.extensions = ["ext/libv8/extconf.rb"]
  s.require_paths = ["lib"]

  s.add_development_dependency "rake", "~> 0.9.2"
  s.add_development_dependency "rake-compiler"
  s.add_development_dependency "rspec"
end
