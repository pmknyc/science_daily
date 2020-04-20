 
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "science_daily/version"

Gem::Specification.new do |spec|
  spec.name          = "science_daily"
  spec.version       = ScienceDaily::VERSION
  spec.authors       = ["Paula McKinley"]
  spec.email         = ["pmknyc@optimum.net"]

  spec.summary       = %q{See 10 Top Science News articles and summary of each.}
  spec.description   = %q{A CLI application that lets you quickly check 10 Top Science News headlines and a summary of each, similar to an RSS feed.}
  spec.homepage      = git repo "https://github.com/pmknyc/science_daily"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/pmknyc/science_daily"
    spec.metadata["changelog_uri"] = "https://github.com/pmknyc/science_daily/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 2.0"
  spec.add_dependency "nokogiri", "(> 1.10.4)"
  spec.add_dependency "colorize"
  spec.add_dependency "require_relative"
  spec.add_dependency "wrapify"

  # spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec_add_development_dependency 'solargraph'
end
