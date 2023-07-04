require 'java'

require_relative 'jar/archetype-0.1.0.jar'
require_relative 'jar/wurcsframework-1.2.13.jar'
require_relative 'jar/slf4j-api-2.0.6.jar'

java_import 'org.glytoucan.Archetype'
java_import 'org.glycoinfo.WURCSFramework.wurcs.graph.WURCSGraph'
java_import 'org.glycoinfo.WURCSFramework.util.WURCSException'
java_import 'org.slf4j.Logger'
java_import 'org.slf4j.LoggerFactory'

module GlyTouCan
  def self.archetype(w)
    Archetype.beBorn(w)
  end
end
