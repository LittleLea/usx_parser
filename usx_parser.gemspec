require_relative 'lib/usx_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "usx_parser"
  spec.version       = UsxParser::VERSION
  spec.authors       = ["Derik Olsson"]
  spec.email         = ["derik@littlelea.co"]

  spec.summary       = %q{Parse Unified Scripture XML files, versions 2.6 or 3.0}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/LittleLea/usx_parser"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
