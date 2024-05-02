require 'java'

require_relative '../jar/archetype.jar'
require_relative '../jar/wurcsframework.jar'

java_import 'org.glytoucan.Archetype'
java_import 'org.glycoinfo.WURCSFramework.wurcs.graph.WURCSGraph'
java_import 'org.glycoinfo.WURCSFramework.util.WURCSException'

module GlycoBook
class GlyTouCan
  def archetype(w)
    Hash[Archetype.beBorn(w)]
  end
end
end
