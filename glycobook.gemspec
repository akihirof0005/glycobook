Gem::Specification.new do |spec|
  spec.name          = 'glycobook'
  spec.version       = '0.1.0.alpha.1'
  spec.authors       = ['Akihiro Fujita']
  spec.email         = ['akihirof0005@gmail.com']
  spec.date          = '2023-07-31'
  spec.summary       = 'glycobook Gem'
  spec.description   = ''
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
  spec.platform       = 'java'
  spec.add_dependency 'java',  '~> 0.0.2'
  spec.add_dependency 'colorize',  '~> 0.8.0'
end
