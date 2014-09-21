require File.expand_path('../lib/omniauth-linuxfr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "Bruno Michel"
  gem.email         = "nono@linuxfr.org"
  gem.description   = %q{Official OmniAuth strategy for LinuxFr.org.}
  gem.summary       = %q{Official OmniAuth strategy for LinuxFr.org.}
  gem.homepage      = "https://github.com/linuxfrorg/omniauth-linuxfr.org"

  gem.files         = `git ls-files`.split("\n")
  gem.name          = "omniauth-linuxfr"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::LinuxFr::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
