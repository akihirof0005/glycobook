# lib/my_gem.rb
require 'java'
require_relative  'jar/slf4j-api-2.0.7.jar'

module WurcsFrameWork
  require_relative  'jar/wurcsframework-1.2.13.jar'
  java_import 'org.glycoinfo.WURCSFramework.util.validation.WURCSValidator'
  java_import 'org.slf4j.Logger'
  def self.validator(w)
    validator = WURCSValidator.new
    validator.start(w)
    return { "WURCS" => validator.getReport().toString(),
           "ERROR" => validator.getReport().hasError(),
           "WARNING" => validator.getReport().hasWarning(),
           "UNVERIFIABLE" => validator.getReport().hasUnverifiable(),
           "STANDERD" => validator.getReport().standard_string(),
           "RESULTS" => validator.getReport().getResults()
    }
  end
end

module WurcsFrameWork_1_01
  require_relative  'jar/wurcsframework-1.0.1.jar'
  java_import 'org.glycoinfo.WURCSFramework.util.validation.WURCSValidator'
  java_import 'org.slf4j.Logger'
  def self.validator(w)
    validator = WURCSValidator.new
    validator.start(w)
    return { "WURCS" => validator.getReport().toString(),
           "ERROR" => validator.getReport().hasError(),
           "WARNING" => validator.getReport().hasWarning(),
           "STANDERD" => validator.getReport().standard_string(),
           "RESULTS" => validator.getReport().getResults()
    }
  end
end

