
w = "WURCS=2.0/8,13,12/[a2122h-1b_1-5_2*NCC/3=O][a1122h-1b_1-5][a1122h-1a_1-5][a2112h-1b_1-5][Aad21122h-2a_2-6_5*NCC/3=O][a2122h-1b_1-5_2*NCC/3=O_6*OSO/3=O/3=O][a2112h-1b_1-5_6*OSO/3=O/3=O][a1221m-1a_1-5]/1-1-2-3-1-4-5-3-1-4-6-7-8/a4-b1_a6-m1_b4-c1_c3-d1_c6-h1_d2-e1_e4-f1_f6-g2_h2-i1_i4-j1_j3-k1_k4-l1"

require 'subsumption'
require 'wurcsframework'
require 'glytoucan'

pp WurcsFrameWork.validator(w)
pp WurcsFrameWork_1_01.validator(w)
pp Subsumption.topology(w)
pp GlyTouCan.archetype(w)


