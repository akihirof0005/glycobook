# lib/my_gem.rb
require 'java'
require_relative  'jar/slf4j-api.jar'

module WurcsFrameWork
  require_relative  'jar/wurcsframework.jar'
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
