require_relative 'lib/activerecord/pattern_match/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-pattern_match"
  spec.version       = Activerecord::PatternMatch::VERSION
  spec.authors       = ["osyo-manga"]
  spec.email         = ["manga.osyo@gmail.com"]

  spec.summary       = %q{activerecord with pattern match}
  spec.description   = %q{activerecord with pattern match}
  spec.homepage      = "https://github.com/osyo-manga/activerecord-pattern_match"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 5.2"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3"
end
