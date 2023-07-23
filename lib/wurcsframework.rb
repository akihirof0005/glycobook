# lib/my_gem.rb
require 'java'
require_relative  'jar/slf4j-api.jar'

class WurcsFrameWork
  require_relative  'jar/wurcsframework.jar'
  java_import 'org.glycoinfo.WURCSFramework.util.validation.WURCSValidator'
  java_import 'org.slf4j.Logger'
  def validator(w)
    validator = WURCSValidator.new
    validator.start(w)
    reports = {}
    reports["VALIDATOR"] = ["WURCSFramework-1.2.13"]
    reports["WARNING"] = validator.getReport().hasWarning()
    reports["ERROR"] = validator.getReport().hasError()
    reports["UNVERIFIABLE"] = validator.getReport().hasUnverifiable()
    return {"message" => reports,
            "StandardWURCS" => validator.getReport().standard_string(),
            "RESULTS" => validator.getReport().getResults() }
  end
end
