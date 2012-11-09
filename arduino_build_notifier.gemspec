Gem::Specification.new do |s|
  s.name        = 'arduino_build_notifier'
  s.version     = '0.0.2'
  s.date        = '2012-11-08'
  s.summary     = "An Integration server notifier"
  s.description = "like ccmenu but with Arduino"
  s.authors     = ["Herman Moreno"]
  s.email       = 'herman.moreno@crowdint.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/supherman/arduino_build_notifier'

  s.executables = ['ard-notifier']

  s.add_development_dependency('rspec')

  s.add_dependency('celluloid')
  s.add_dependency('dino')
  s.add_dependency('gli')
  s.add_dependency('httparty')
  s.add_dependency('nokogiri')
end

