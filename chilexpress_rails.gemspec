Gem::Specification.new do |s|
  s.name        = 'chilexpress_rails'
  s.version     = '0.1.1'
  s.date        = '2017-02-22'
  s.summary     = 'retreive tracking info'
  s.description = 'This gem will give some tracking information'
  s.authors     = ['Zetahawke']
  s.email       = 'michel.szinavel@gmail.com'
  s.files       = ['lib/chilexpress_rails.rb', 'lib/chilexpress_rails/order.rb']
  s.homepage    =
    'http://rubygems.org/gems/chilexpress_rails'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.2'

  s.add_dependency 'nokogiri', '~> 1.6'

  s.add_development_dependency 'bundler', '~> 1.9'
  s.add_development_dependency 'rake', '~> 10.0'
end
