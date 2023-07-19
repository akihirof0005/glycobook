require 'wurcsverify'
require 'csv'
#require 'parallel'

data_path = './glytoucan-glycan.csv'
csv_data = CSV.read(data_path, encoding: 'bom|utf-8')

kawari_path = './archetype.csv'
kawari_data = CSV.read(kawari_path, encoding: 'bom|utf-8')
kawari={}
kawari_data.each do |item|
 kawari[item[0]] = item[1]
end

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
wf = WurcsVerify.initialize_module
error = "|ID|version|sequence|\n| :--- | :--- | :--- |\n"
unverifiable =  "|ID|version|sequence|\n| :--- | :--- | :--- |\n"
diff =  "|ID|version|sequence|\n| :--- | :--- | :--- |\n"
#Parallel.each(csv_data,in_threads: 15 ) do |id,w|
csv_data.each do |id,w|
if kawari.key?(w)
    w = kawari[w]
  end
#csv_data[169089..170000].each do |id,w|
  count = count +1
  $stderr.print "\r"+count.to_s
#  $stderr.puts count.to_s
#  $stderr.puts id

  wfvv = wf.validatorVerify(w)
  if wfvv["latest"]["ERROR"]
    if wfvv["1.0.1"]["ERROR"]
      $stderr.puts id
      error = error +"\n"+ "|"+id+"|1.0.1| " + wfvv["1.0.1"]["RESULTS"].gsub(/\R/, "<br>") + "|"
      error = error +"\n"+ "|"+id+"|latest| " + wfvv["latest"]["RESULTS"].gsub(/\R/, "<br>") + "|"
    else
      error = error +"\n"+ "|"+id+"|1.0.1| " + wfvv["1.0.1"]["STANDERD"] + "|"
      error = error +"\n"+ "|"+id+"|latest| " + wfvv["latest"]["RESULTS"].gsub(/\R/, "<br>") + "|"
    end
  elsif wfvv["latest"]["UNVERIFIABLE"]
    unverifiable = unverifiable +"\n"+ "|"+id+"|1.0.1| " + wfvv["1.0.1"]["STANDERD"] + "|"
    unverifiable = unverifiable +"\n"+ "|"+id+"|latest| " + wfvv["latest"]["RESULTS"].gsub(/\R/, "<br>")+ "|"
  else
    results = aligned_character_color_diff(
      wfvv["1.0.1"]["STANDERD"],
      wfvv["latest"]["STANDERD"])
    if results[0]
      diff = diff + "\n"+"|"+id+"|1.0.1| " + results[1] + "|"
      diff = diff +"\n"+"|"+id+"|latest| " + results[2] + "|"
    else
      next
    end
  end
end
File.write("error.md", error)
File.write("unverifiable.md", unverifiable)
File.write("diff.md", diff)