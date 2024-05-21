require 'java'
require 'json'
require 'pathname'
require 'colorize'

require_relative 'jar/slf4j-api.jar'

java_import 'java.net.URL'
java_import 'java.net.URLClassLoader'
java_import 'org.slf4j.Logger'

class WurcsVerify

  @@gtc_version = "1.2.14"
  @@v1215 = "1.2.15"
  @@v1216 = "1.2.16"
  @@v130 = "1.3.0"
  @@v131 = "1.3.1"

  def initialize
      @wfw_glytoucan_loader = self.create_custom_classloader("jar/wurcsframework-" + @@gtc_version + ".jar")
      @wfw_v131_loader = self.create_custom_classloader("jar/wurcsframework-" + @@v131 + ".jar")
      @wfw_v130_loader = self.create_custom_classloader("jar/wurcsframework-" + @@v130 + ".jar")
      @wfw_v1216_loader = self.create_custom_classloader("jar/wurcsframework-" + @@v1216 + ".jar")
      @wfw_v1215_loader = self.create_custom_classloader("jar/wurcsframework-" + @@v1215 + ".jar")
      @validator_glytoucan = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator",true,@wfw_glytoucan_loader)
      @validator_v131 = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator", true, @wfw_v131_loader)
      @validator_v130 = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator", true, @wfw_v130_loader)
      @validator_v1216 = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator", true, @wfw_v1216_loader)
      @validator_v1215 = java.lang.Class.forName("org.glycoinfo.WURCSFramework.util.validation.WURCSValidator", true, @wfw_v1215_loader)
  end

  def create_custom_classloader(jar_path)
    absolute_path = File.dirname(File.expand_path(__FILE__)) + "/" + jar_path
    url = URL.new("file:#{absolute_path}")
    URLClassLoader.newInstance([url].to_java(URL), java.lang.Thread.currentThread.getContextClassLoader)
  end

  def validatorVerify(w,style)
    v_glytoucan = @validator_glytoucan.new_instance
    v_glytoucan.start(w)

    v_131 = @validator_v131.new_instance
    v_131.start(w)

    v_130 = @validator_v130.new_instance
    v_130.start(w)

    v_1216 = @validator_v1216.new_instance
    v_1216.start(w)

    v_1215 = @validator_v1215.new_instance
    v_1215.start(w)

    if (style == "v3")
      ret = {@@gtc_version => self.dovalidatorv3(v_glytoucan,@@gtc_version),
        @@v131  => self.dovalidatorv3(v_131, @@v131),
        @@v130  => self.dovalidatorv3(v_130, @@v130),
        @@v1215 => self.dovalidatorv3(v_1215, @@v1215),
        @@v1216 => self.dovalidatorv3(v_1216, @@v1216)
      }
    elsif (style == "wfw")
      ret = {@@gtc_version => self.dovalidator(v_glytoucan,@@gtc_version),
      @@v131  => self.dovalidator(v_131, @@v131),
      @@v130  => self.dovalidator(v_130, @@v130),
      @@v1215 => self.dovalidator(v_1215, @@v1215),
      @@v1216 => self.dovalidator(v_1216, @@v1216)
      }
    else
      pp "strange second paramerters"
    end
    return ret
  end

  def dovalidatorv3(validator,version)
    if validator.getReport().respond_to?(:isStandardized)
      flag = validator.getReport().isStandardized()
    else
      flag = "undef"
    end
    reports = { "VALIDATOR" => ["WURCSFramework-" + version],
                "WARNING" => validator.getReport().hasWarning(),
                "FLAG" => flag,
                "ERROR" => validator.getReport().hasError(),
                "UNVERIFIABLE" => validator.getReport().hasUnverifiable() }
    return {"message" => reports,
            "StandardWURCS" => validator.getReport().standard_string(),
            "RESULTS" => validator.getReport().getResults() }
  end
  def dovalidator(validator,version)
    return {"VALIDATOR" => ["WURCSFramework-" + version],
            "Report" => validator.getReport().getResults()}
  end
end
