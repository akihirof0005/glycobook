require 'glycanformatconverter'

w = "WURCS=2.0/3,5,4/[a2122h-1b_1-5_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5]/1-1-2-3-3/a4-b1_b4-c1_c3-d1_c6-e1"

iupac = GlycanFormatConverter.wurcs2iupac(w,"condensed")
iupacex = GlycanFormatConverter.wurcs2iupac(w,"extended")
ct = GlycanFormatConverter.wurcs2glycoct(w)
glycam = GlycanFormatConverter.wurcs2glycam(w)

puts iupac
puts iupacex
puts ct
puts glycam

require 'wurcsverify'

wf = WurcsVerify.init
wfvv = wf.validatorVerify(w)

pp wfvv


require 'wurcsframework'

pp WurcsFrameWork.validator(w)


require 'subsumption'

pp Subsumption.topology(w)

require 'glytoucan'

pp GlyTouCan.archetype(w)

require 'glycanbuilder'
pp GlycanBuilder.generatePng(w)
#pp GlycanBuilder.generateSvg(w)
