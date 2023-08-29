# getting start

Install jruby.

## Install (for user)
```bash
gem install glycobook --pre
 
ruby -r bookinit -e BookInit.run
```

## Build (for develop)
```bash
gem build glycobook.gemspec
```

## sample program
```ruby
require 'glycobook'

w = "WURCS=2.0/3,5,4/[a2122h-1b_1-5_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5]/1-1-2-3-3/a4-b1_b4-c1_c3-d1_c6-e1"

gfc = GlycoBook::GlycanFormatConverter.new

iupac = gfc.wurcs2iupac(w,"condensed")
iupacex = gfc.wurcs2iupac(w,"extended")
ct = gfc.wurcs2glycoct(w)
glycam = gfc.wurcs2glycam(w)

puts iupac
puts iupacex
puts ct
puts glycam

wfw = GlycoBook::WurcsFrameWork.new
puts wfw.validator(w)

ssp =  GlycoBook::Subsumption.new
pp ssp.topology(w)

gtc = GlycoBook::GlyTouCan.new
pp gtc.archetype(w)

gb = GlycoBook::GlycanBuilder.new
pp gb.generatePng(w,1)
pp gb.generateSvg(w)
```
