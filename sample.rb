require 'wurcsverify'
require 'csv'

data_path = './glytoucan-glycan.csv'
csv_data = CSV.read(data_path, encoding: 'bom|utf-8')

def aligned_character_color_diff(one, other)
    max_length = [one.length, other.length].max
    one_aligned = one.ljust(max_length)
    other_aligned = other.ljust(max_length)

    one_diff = ""
    other_diff = ""
    flag = false

    one_aligned.chars.each_with_index do |char, index|
      if char != other_aligned[index]
        flag = true
        one_diff += "<span style=\"color: green; \">" + other_aligned[index] + "</span>"
        other_diff += "<span style=\"color: magenta; \">" + one_aligned[index] + "</span>"
      else
        one_diff += char
        other_diff += char
      end
    end
    return [ flag, one_diff, other_diff]
end
count =0
puts "|ID|version|sequence|"
puts "| :--- | :--- | :--- |"
wf = WurcsVerify.initialize_module
csv_data.each do |id,w|
#csv_data[169089..170000].each do |id,w|
  count = count +1
  $stderr.print "\r"+count.to_s
#  $stderr.puts count.to_s
#  $stderr.puts id

  wfvv = wf.validatorVerify(w)
  if wfvv["latest"]["ERROR"]
    if wfvv["1.0.1"]["ERROR"]
      $stderr.puts id
      puts "|"+id+"|1.0.1| " + wfvv["1.0.1"]["RESULTS"].gsub(/\R/, "<br>") + "|"
      puts "|^ |latest| " + wfvv["latest"]["RESULTS"].gsub(/\R/, "<br>") + "|"
    else
      puts "|"+id+"|1.0.1| " + wfvv["1.0.1"]["STANDERD"] + "|"
      puts "|^ |latest| " + wfvv["latest"]["RESULTS"].gsub(/\R/, "<br>") + "|"
    end
  elsif wfvv["latest"]["UNVERIFIABLE"]
    puts "|"+id+"|1.0.1| " + wfvv["1.0.1"]["STANDERD"] + "|"
    puts "|^ |latest| " + wfvv["latest"]["RESULTS"].gsub(/\R/, "<br>")+ "|"
  else
    results = aligned_character_color_diff(
      wfvv["1.0.1"]["STANDERD"],
      wfvv["latest"]["STANDERD"])
    if results[0]
      puts "|"+id+"|1.0.1| " + results[1] + "|"
      puts "|^ |latest| " + results[2] + "|"
    else
      next
    end
  end
end
