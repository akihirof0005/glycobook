Gem::Specification.new do |spec|
  spec.name          = 'glycobook'
  spec.version       = '0.0.8'
  spec.authors       = ['Akihiro Fujita']
  spec.email         = ['akihirof0005@gmail.com']
  spec.summary       = 'glycobook Gem'
  spec.description   = 'A description of dadadadada'
  spec.homepage      = 'https://gitlab.com/glycobook/gems/glycobook/'
  spec.license       = 'LGPL-3.0'
  spec.files         = ["lib/wurcsframework.rb",
                        "lib/glycanformatconverter.rb",
                        "lib/subsumption.rb",
                        "lib/glytoucan.rb",
                        "lib/glycobook.rb",
                        "lib/glycanbuilder.rb",
                        "jar.yml",
                        "lib/wurcsverify.rb"]
  spec.add_dependency 'java',  '~> 0.0.2'
  spec.add_dependency 'colorize',  '~> 0.8.0'
end
