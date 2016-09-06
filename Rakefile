# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "omgtex"
  gem.homepage = "http://github.com/x3ro/omgtex"
  gem.license = "MIT"
  gem.summary = %Q{Essentially runs *TeX the appropriate number of times}
  gem.description = %Q{Builds your *TeX files by running *tex an appropriate amount of times}
  gem.email = "public@x3ro.de"
  gem.authors = ["Lucas Jenß"]
  gem.executables = ["omgtex"]
  gem.cert_chain = ["certs/fresskoma.pem"]
  gem.signing_key = File.expand_path("~/.ssh/keys/rubygems/gem-private_key.pem")
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new
