# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "sinatra", "~>2.0", ">=2.0.7"

gem "mongoid", "~> 7.0", ">=7.0.5"

group :test do
  gem "rspec", "~> 3.9", ">=3.9.0"

  gem "rack-test", "~> 1.1", ">=1.1.0"
  gem "rspec_junit_formatter", "~> 0.4.1", ">= 0.4.1"
  gem "rubocop-junit_formatter", "~> 0.2", ">= 0.2"
  gem "rubocop", "~> 0.78", ">= 0.78.0"
end
