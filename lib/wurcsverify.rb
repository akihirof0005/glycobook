require 'java'
require 'json'
require 'pathname'
require 'colorize'

require_relative 'jar/slf4j-api-2.0.7.jar'

java_import 'java.net.URL'
java_import 'java.net.URLClassLoader'
java_import 'org.slf4j.Logger'

module WurcsVerify

  def self.create_custom_classloader(jar_path)
  absolute_path = File.dirname(File.expand_path(__FILE__)) + "/" + jar_path
  url = URL.new("file:#{absolute_path}")
  URLClassLoader.newInstance([url].to_java(URL), java.lang.Thread.currentThread.getContextClassLoader)
end

  def self.aligned_character_color_diff(old_text, new_text)
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

  def self.validatorVerify(w)
    wfw_latest_loader = self.create_custom_classloader("jar/wurcsframework-1.2.13.jar")
    wfw_101_loader = self.create_custom_classloader("jar/wurcsframework-1.0.1.jar")

    validator_latest = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator",true,wfw_latest_loader)
    validator_101 = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator", true, wfw_101_loader)


    validator_latest = validator_latest.new_instance
    validator_latest.start(w)

    validator_101 = validator_101.new_instance
    validator_101.start(w)

    return {"latest" => self.dovalidator(validator_latest),
            "1.0.1" => self.dovalidator101(validator_101) }
  end

  def self.dovalidator(validator)
    return { "WURCS" => validator.getReport().toString(),
           "ERROR" => validator.getReport().hasError(),
           "WARNING" => validator.getReport().hasWarning(),
           "UNVERIFIABLE" => validator.getReport().hasUnverifiable(),
           "STANDERD" => validator.getReport().standard_string(),
           "RESULTS" => validator.getReport().getResults()
    }
  end
  def self.dovalidator101(validator)
    return { "WURCS" => validator.getReport().toString(),
           "ERROR" => validator.getReport().hasError(),
           "WARNING" => validator.getReport().hasWarning(),
           "UNVERIFIABLE" => false,
           "STANDERD" => validator.getReport().standard_string(),
           "RESULTS" => validator.getReport().getResults()
    }
  end
end
