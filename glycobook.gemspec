Gem::Specification.new do |spec|
  spec.name          = 'glycobook'
  spec.version       = '0.0.9'
  spec.authors       = ['Akihiro Fujita']
  spec.email         = ['akihirof0005@gmail.com']
  spec.summary       = 'glycobook Gem'
  spec.description   = 'A description of dadadadada'
  spec.homepage      = 'https://gitlab.com/glycobook/gems/glycobook/'
  spec.license       = 'LGPL-3.0'
  spec.files         = ["lib/glycobook/wurcs_frame_work.rb",
                        "lib/glycobook/glycan_format_converter.rb",
                        "lib/glycobook/subsumption.rb",
                        "lib/glycobook/gly_tou_can.rb",
                        "lib/glycobook/glycan_builder.rb",
                        "lib/glycobook.rb",
                        "lib/bookinit.rb",
                        "jar.yml",
                        "lib/wurcsverify.rb"]
  spec.add_dependency 'java',  '~> 0.0.2'
  spec.add_dependency 'colorize',  '~> 0.8.0'
end
