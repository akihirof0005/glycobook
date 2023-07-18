require 'wurcsverify.rb'
require 'csv'

w = "WURCS=2.0/2,2,1/[h1122h_1-5][a2122h-1b_1-5_2*NCC/3=O]/1-2/a2-b1"
wf = WurcsVerify.initialize_module
wfvv = wf.validatorVerify(w)
pp wfvv["latest"]
pp wfvv["1.0.1"]

