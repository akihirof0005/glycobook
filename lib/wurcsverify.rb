require 'java'
require 'json'
require 'pathname'
require 'colorize'

require_relative 'jar/slf4j-api.jar'

java_import 'java.net.URL'
java_import 'java.net.URLClassLoader'
java_import 'org.slf4j.Logger'

module WurcsVerify
  def self.init
      @wfw_latest_loader = self.create_custom_classloader("jar/wurcsframework-1.2.13.jar")
      @wfw_101_loader = self.create_custom_classloader("jar/wurcsframework-1.0.1.jar")
      @validator_latest = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator",true,@wfw_latest_loader)
      @validator_101 = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator", true, @wfw_101_loader)
  return self
  end

  def self.create_custom_classloader(jar_path)
    absolute_path = File.dirname(File.expand_path(__FILE__)) + "/" + jar_path
    url = URL.new("file:#{absolute_path}")
    URLClassLoader.newInstance([url].to_java(URL), java.lang.Thread.currentThread.getContextClassLoader)
  end

  def self.validatorVerify(w)
    v_latest = @validator_latest.new_instance
    v_latest.start(w)

    v_101 = @validator_101.new_instance
    v_101.start(w)

    ret = {"1.2.13" => self.dovalidator(v_latest),
            "1.0.1" => self.dovalidator101(v_101) }
    return ret
  end

  def self.dovalidator(validator)
    reports = { "VALIDATOR" => ["WURCSFramework-1.2.13"],
                "WARNING" => validator.getReport().hasWarning(),
                "UNVERIFIABLE" => validator.getReport().hasUnverifiable() }
    return {"message" => reports,
            "StandardWURCS" => validator.getReport().standard_string(),
            "RESULTS" => validator.getReport().getResults() }
  end
  def self.dovalidator101(validator)
    reports = { "VALIDATOR" => ["WURCSFramework-1.0.1"],
                "WARNING" => validator.getReport().hasWarning(),
                "UNVERIFIABLE" => validator.getReport().hasUnverifiable() }
    return {"message" => reports,
            "StandardWURCS" => validator.getReport().standard_string(),
            "RESULTS" => validator.getReport().getResults() }
  end
end
