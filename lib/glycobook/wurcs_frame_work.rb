require 'java'

module GlycoBook

  class WurcsFrameWork
    require_relative  '../jar/wurcsframework.jar'
    java_import 'org.glycoinfo.WURCSFramework.util.validation.WURCSValidator'
    
    def validator(w)
      validator = WURCSValidator.new
      validator.start(w)
      reports = {}
      reports["VALIDATOR"] = ["WURCSFramework-1.2.14"]
      reports["WARNING"] = validator.getReport().hasWarning()
      reports["ERROR"] = validator.getReport().hasError()
      reports["UNVERIFIABLE"] = validator.getReport().hasUnverifiable()
      return {"message" => reports,
            "StandardWURCS" => validator.getReport().standard_string(),
            "RESULTS" => validator.getReport().getResults() }
    end
  end
end
