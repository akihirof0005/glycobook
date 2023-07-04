Gem::Specification.new do |spec|
  spec.name          = 'wurcsframework'
  spec.version       = '0.0.1'
  spec.authors       = ['Akihiro Fujita']
  spec.email         = ['akihirof0005@gmail.com']
  spec.summary       = 'WURCSFramework Gem'
  spec.description   = 'A description of WURCSFramework Gem.'
  spec.homepage      = 'https://gitlab.com/glycobook/gems/wurcsframework/'
  spec.license       = 'LGPL-3.0'
  spec.files         = ["lib/wurcsframework.rb", "lib/jar/slf4j-api-2.0.6.jar", "lib/jar/wurcsframework-1.2.13.jar"]
  spec.add_dependency 'java',  '~> 0.0.2'
end
