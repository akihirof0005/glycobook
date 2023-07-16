require 'wurcsverify'

array = ['WURCS=2.0/1,1,0/[u111xh_2*NCC/3=O_6*OC(CCCCCC/3CCCCCC0/3CCCCCC6)/13OC/7OC]/1/',
'WURCS=2.0/1,1,0/[u111xh_2*NCC/3=O_6*OC(CCCCCC/3CCCCCC0/3CCCCCC6)/13OC/7OC]/1/',
'WURCS=2.0/1,1,0/[u111xh_2*NCC/3=O_6*OC(CCCCCC/3CCCCCC0/3CCCCCC6)/13OC/7OC]/1/']


def aligned_character_color_diff(old_text, new_text)
    max_length = [old_text.length, new_text.length].max
    old_aligned = old_text.ljust(max_length)
    new_aligned = new_text.ljust(max_length)

    diff_result = ""

    old_aligned.chars.each_with_index do |char, index|
      if char != new_aligned[index]
        diff_result += new_aligned[index].green
      else
        diff_result += char
      end
    end
    puts old_text
    puts diff_result
end

array.each do |w|


if WurcsVerify.validatorVerify(w)["latest"]["ERROR"]
pp WurcsVerify.validatorVerify(w)["latest"]["RESULTS"]
else

aligned_character_color_diff(
  WurcsVerify.validatorVerify(w)["1.0.1"]["STANDERD"],
  WurcsVerify.validatorVerify(w)["latest"]["STANDERD"])
end

end
