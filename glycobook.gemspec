Gem::Specification.new do |spec|
  spec.name          = 'glycobook'
  spec.version       = '0.1.0.alpha.13'
  spec.authors       = ['Akihiro Fujita']
  spec.email         = ['akihirof0005@gmail.com']
  spec.date          = '2023-11-15'
  spec.summary       = 'Glycobook is a JRuby library for glycaninformatics'
  spec.description   = 'Glycobook is a JRuby library for glycaninformatics'
  spec.homepage      = 'https://github.com/akihirof0005/glycobook/blob/main/README.md'
  spec.license       = 'LGPL-3.0'
  spec.files         = ["lib/glycobook/Loggerinit.rb",
                        "lib/glycobook/wurcs_frame_work.rb",
                        "lib/glycobook/glycan_format_converter.rb",
                        "lib/glycobook/subsumption.rb",
                        "lib/glycobook/gly_tou_can.rb",
                        "lib/glycobook/glycan_builder.rb",
                        "lib/glycobook.rb",
                        "lib/bookinit.rb",
                        "jar.yml",
                        "lib/wurcsverify.rb"]
  spec.metadata = {
                        "source_code_uri" => "https://github.com/akihirof0005/glycobook",
                        "homepage_uri" => "https://github.com/akihirof0005/glycobook/blob/main/README.md",
                        "changelog_uri" => "https://github.com/akihirof0005/glycobooks",
                        }
  spec.platform       = 'java'
  spec.add_dependency 'java',  '~> 0.0.2'
end
