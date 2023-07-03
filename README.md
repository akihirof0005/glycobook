## dependency resolution

```bash
rbenv install jruby
```
```bash
curl "https://gitlab.com/glycoinfo/wurcsframework/-/package_files/73054558/download" -o "lib/jar/wurcsframework-1.2.13.jar"
curl https://repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.6/slf4j-api-2.0.6.jar -o "lib/jar/slf4j-api-2.0.6.jar"
```

## Build
```bash
gem build ./wurcsframework.gemspec

``````
## Install
```bash
gem install wurcsframework-0.0.1.gem

```
## sample program
```ruby
require 'wurcsframework'

pp Wurcsframework.validator("WURCS=2.0/6,20,19/[u2122h_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5][a2122h-1b_1-5_2*NCC/3=O][a2112h-1b_1-5][a2112h-1a_1-5]/1-2-3-4-5-4-5-6-4-5-6-3-4-5-4-5-6-4-5-6/a4-b1_b3-c1_b6-l1_c2-d1_d4-e1_e3-f1_e6-i1_f4-g1_g3-h1_i4-j1_j3-k1_l2-m1_m4-n1_n3-o1_n6-r1_o4-p1_p3-q1_r4-s1_s3-t1")
```
