# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'solidus_slider/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_slider'
  s.version     = SolidusSlider.version
  s.summary     = 'Solidus Slider extension'
  s.description = 'Adds a slider to the homepage'
  s.required_ruby_version = '>= 2.1.0'

  s.author            = 'Mohammed Gharbi'
  s.email             = 'mgharbik@gmail.com'
  s.homepage          = 'https://github.com/simo163/solidus_slider'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus_core', s.version
  s.add_dependency 'solidus_backend', s.version
end
