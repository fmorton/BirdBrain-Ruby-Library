require_relative 'lib/birdbrain/version'

Gem::Specification.new do |spec|
  spec.name          = 'birdbrain'
  spec.version       = Birdbrain::VERSION
  spec.authors       = ['fmorton']
  spec.email         = ['fmorton@mac.com']

  spec.summary       = 'Ruby Library for Hummingbird Bit (and maybe Finch 2 later)'
  spec.description   = 'This Ruby library allows students to use Ruby to read sensors and set motors and LEDs with the '\
                      'Birdbrain Technologies Hummingbird Bit. To use Ruby with the Hummingbird Bit, you must connect '\
                      'to the Hummingbird Bit via bluetooth with the BlueBird Connector.'
  spec.homepage      = 'https://github.com/fmorton/BirdBrain-Ruby-Library'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/fmorton/BirdBrain-Ruby-Library'
  spec.metadata['changelog_uri'] = 'https://github.com/fmorton/BirdBrain-Ruby-Library/doc/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency 'example-gem', '~> 1.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
