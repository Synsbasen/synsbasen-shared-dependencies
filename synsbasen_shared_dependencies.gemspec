# frozen_string_literal: true

require_relative "lib/synsbasen_shared_dependencies/version"

Gem::Specification.new do |spec|
  spec.name = "synsbasen_shared_dependencies"
  spec.version = SynsbasenSharedDependencies::VERSION
  spec.authors = ["Jimmy Poulsen", "Tobias Knudsen"]
  spec.email = ["jimmy@poulsen.dk", "tobias.knudsen@gmail.com"]

  spec.summary = "A gem for managing shared dependencies at Synsbasen across multiple applications."
  spec.description = "This gem provides a collection of dependencies shared across Synsbasen's applications, including essential libraries for web application performance, monitoring, and error tracking."
  spec.homepage = "https://api.synsbasen.dk/"
  spec.license = "MIT"
  spec.required_ruby_version = "~> 3.2.1"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Synsbasen/synsbasen-shared-dependencies"
  spec.metadata["changelog_uri"] = "https://github.com/Synsbasen/synsbasen-shared-dependencies/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Specify the dependencies for the gem
  spec.add_dependency "rails", "8.0.2"
  spec.add_dependency "railties", "8.0.2"
  spec.add_dependency "pg", "1.5.9"
  spec.add_dependency "puma", "6.4.3"
  spec.add_dependency "redis", "4.8.1"
  spec.add_dependency "pundit", "2.4.0"
  spec.add_dependency "sidekiq", "7.3.4"
  spec.add_dependency "sidekiq-unique-jobs", "8.0.10"
  spec.add_dependency "sentry-ruby", "5.21.0"
  spec.add_dependency "sentry-rails", "5.21.0"
  spec.add_dependency "sentry-sidekiq", "5.21.0"
  spec.add_dependency "prometheus_exporter", "2.1.1"
  spec.add_dependency "listen", "3.9"
  spec.add_dependency "ransack", "4.2.1"
  spec.add_dependency "slim", "5.2.1"
  spec.add_dependency "slim-rails", "3.6.3"
  spec.add_dependency "autoprefixer-rails", "10.4.19.0"
  spec.add_dependency "jsbundling-rails", "1.3.1"
  spec.add_dependency "cssbundling-rails", "1.4.1"
  spec.add_dependency "propshaft", "1.1.0"
  spec.add_dependency "redcarpet", "3.6.0"
  spec.add_dependency "paranoia", "3.0.0"
  spec.add_dependency "slack-ruby-client", "2.1.0"
  spec.add_dependency "async-websocket", "0.8.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
