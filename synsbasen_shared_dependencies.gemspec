# frozen_string_literal: true

require_relative "lib/synsbasen_shared_dependencies/version"

Gem::Specification.new do |spec|
  spec.name = "synsbasen_shared_dependencies"
  spec.version = SynsbasenSharedDependencies::VERSION
  spec.authors = ["Jimmy Poulsen", "Tobias Knudsen"]
  spec.email = ["jimmy@poulsen.dk", "tobias.knudsen@gmail.com"]

  spec.summary = "Write a short summary, because RubyGems requires one."
  spec.description = ""
  spec.homepage = "https://api.synsbasen.dk/"
  spec.license = "MIT"
  spec.required_ruby_version = "~> 3.2.1"

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://api.synsbasen.dk/"
  spec.metadata["changelog_uri"] = "https://api.synsbasen.dk/"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Specify the dependencies for the gem
  spec.add_dependency "rails", "~> 7.2"
  spec.add_dependency "pg", "~> 1.1"
  spec.add_dependency "puma", "~> 6.0"
  spec.add_dependency "redis", "~> 4.0"
  spec.add_dependency "pundit", "~> 2.4.0"
  spec.add_dependency "sidekiq", "~> 7.3.4"
  spec.add_dependency "sidekiq-unique-jobs", "~> 8.0.10"
  spec.add_dependency "sentry-ruby", "~> 5.21.0"
  spec.add_dependency "sentry-rails", "~> 5.21.0"
  spec.add_dependency "sentry-sidekiq", "~> 5.21.0"
  spec.add_dependency "prometheus_exporter", "~> 2.1.1"
  spec.add_dependency "listen", "~> 3.3"
  spec.add_dependency "ransack", "~> 4.2.1"
  spec.add_dependency "slim", "~> 5.2.1"
  spec.add_dependency "slim-rails", "~> 3.6.3"
  spec.add_dependency "sassc-rails", "~> 2.1.2"
  spec.add_dependency "autoprefixer-rails", "~> 10.4.19.0"
  spec.add_dependency "jsbundling-rails", "~> 1.3.1"
  spec.add_dependency "cssbundling-rails", "~> 1.4.1"
  spec.add_dependency "sprockets-rails", "~> 3.5.2"
  spec.add_dependency "redcarpet", "~> 3.6.0"
  spec.add_dependency "paranoia", "~> 3.0.0"

  # Specify development and test dependencies
  spec.add_development_dependency "dockerfile-rails", "~> 1.6.22"
  spec.add_development_dependency "pry", "~> 0.14.2"
  spec.add_development_dependency "rspec-rails", "~> 7.0"
  spec.add_development_dependency "rspec-sidekiq", "~> 5.0"
  spec.add_development_dependency "web-console", "~> 4.2.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
