# frozen_string_literal: true

require_relative "lib/llamakit/version"

Gem::Specification.new do |spec|
  spec.name          = "llamakit"
  spec.version       = Llamakit::VERSION
  spec.authors       = ["lessonly"]
  spec.email         = ["adam.kessler@lessonly.com"]

  spec.summary       = "Adds common modules used in Lessonly apps"
  spec.homepage      = "https://github.com/lessonly/llamakit"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://raw.githubusercontent.com/lessonly/llamakit/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "byebug"
  spec.add_dependency "rack"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
