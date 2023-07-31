# getting start

Install jruby.

## Install
```bash
gem install glycobook --pre
 
ruby -r bookinit -e BookInit.run

##edit your setting file
vim  ~/.glycobook/jar.yml

ruby -r bookinit -e BookInit.run
```

## Build
```bash
gem build glycobook.gemspec
```
## sample program
```ruby
require 'wurcsframework'

pp WurcsFrameWork.validator("WURCS=2.0/6,20,19/[u2122h_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5][a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5][a2112h-1a_1-5]/1-2-3-4-5-4-5-6-4-5-6-3-4-5-4-5-6-4-5-6/a4-b1_b3-c1_b6-l1_c2-d1_d4-e1_e3-f1_e6-i1_f4-g1_g3-h1_i4-j1_j3-k1_l2-m1_m4-n1_n3-o1_n6-r1_o4-p1_p3-q1_r4-s1_s3-t1")
```