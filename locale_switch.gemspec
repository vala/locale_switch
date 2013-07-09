$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "locale_switch/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "locale_switch"
  s.version     = LocaleSwitch::VERSION
  s.authors     = ["Valentin Ballestrino"]
  s.email       = ["vala@glyph.fr"]
  s.homepage    = "http://glyph.fr"
  s.summary     = "Small Rails engine to allow easy locale switching and handling in your app"
  s.description = "Small Rails engine to allow easy locale switching and handling in your app"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
