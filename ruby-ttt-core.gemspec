Gem::Specification.new do |s|
  s.name        = 'ruby-ttt-core'
  s.version     = '1.0.6'
  s.date        = '2017-03-02'
  s.summary     = "The core for my ruby tic tac toe."
  s.description = "The core for my ruby tic tac toe."
  s.authors     = ["Will Curry"]
  s.email       = ''
  s.files       = `git ls-files`.split($\)
  s.homepage    = ''
  s.license       = 'MIT'

  s.add_development_dependency "rspec"
end
