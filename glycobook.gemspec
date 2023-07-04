Gem::Specification.new do |spec|
  spec.name          = 'glycobook'
  spec.version       = '0.0.1'
  spec.authors       = ['Akihiro Fujita']
  spec.email         = ['akihirof0005@gmail.com']
  spec.summary       = 'glycobook Gem'
  spec.description   = 'A description of dadadadada'
  spec.homepage      = 'https://gitlab.com/glycobook/gems/glycobook/'
  spec.license       = 'LGPL-3.0'
  spec.files         = ["lib/wurcsframework.rb",
                        "lib/subsumption.rb",
                        "lib/glytoucan.rb",
                        "lib/jar/subsumption-0.9.5.jar",
                        "lib/jar/archetype-0.1.0.jar",
                        "lib/jar/slf4j-api-2.0.6.jar",
                        "lib/jar/wurcsframework-1.2.13.jar"]
  spec.add_dependency 'java',  '~> 0.0.2'
end
