Gem::Specification.new do |spec|
  spec.name          = 'glycowrap'
  spec.version       = '0.0.9'
  spec.authors       = ['Akihiro Fujita']
  spec.email         = ['akihirof0005@gmail.com']
  spec.summary       = 'glycowrap Gem'
  spec.description   = 'A description of dadadadada'
  spec.homepage      = 'https://gitlab.com/glycobook/gems/glycobook/'
  spec.license       = 'LGPL-3.0'
  spec.files         = ["lib/glycowrap/wurcs_frame_work.rb",
                        "lib/glycowrap/glycan_format_converter.rb",
                        "lib/glycowrap/subsumption.rb",
                        "lib/glycowrap/gly_tou_can.rb",
                        "lib/glycowrap.rb",
                        "lib/bookinit.rb",
                        "lib/glycowrap/glycan_builder.rb",
                        "jar.yml",
                        "lib/wurcsverify.rb"]
  spec.add_dependency 'java',  '~> 0.0.2'
  spec.add_dependency 'colorize',  '~> 0.8.0'
end
