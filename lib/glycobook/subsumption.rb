require 'java'

require_relative '../jar/subsumption.jar'
require_relative '../jar/wurcsframework.jar'
require_relative '../jar/slf4j-api.jar'

java_import 'org.glycoinfo.subsumption.manipulation.GraphManager'
java_import 'org.glycoinfo.WURCSFramework.wurcs.graph.WURCSGraph'
java_import 'org.glycoinfo.subsumption.util.GraphManagerException'
java_import 'org.glycoinfo.WURCSFramework.util.WURCSException'
java_import 'org.slf4j.Logger'
java_import 'org.slf4j.LoggerFactory'
java_import 'org.glycoinfo.subsumption.generator.Topology'
module GlycoBook
class Subsumption

  def topology(w)
    g = nil
    begin
      g = Topology.beBorn(GraphManager.toGraph(w))
    rescue GraphManagerException => e
      e.printStackTrace()
    rescue WURCSException => e
      e.printStackTrace()
    end
    kotae = GraphManager.toWURCS(g)
    return kotae
  end

  java_import 'org.glycoinfo.subsumption.generator.MonosaccharideCompositionWithoutLinkage'
  def monosaccharideCompositionWithoutLinkage(w)
    g = nil
    begin
      g = MonosaccharideCompositionWithoutLinkage.beBorn(GraphManager.toGraph(w))
      return GraphManager.toWURCS(g)
    rescue WURCSException, GraphManagerException => e
      puts e.message
    end
  end

  java_import 'org.glycoinfo.subsumption.generator.CompositionWithLinkage'
  def compositionWithLinkage(w) #出来てる
    g = CompositionWithLinkage.beBorn(GraphManager.toGraph(w))
    return GraphManager.toWURCS(g)
  end

  java_import 'org.glycoinfo.subsumption.generator.BaseCompositionWithLinkage'
  def baseCompositionWithLinkage(w) #出来てる
    g = nil
    begin
      g = BaseCompositionWithLinkage.beBorn(GraphManager.toGraph(w))
      return GraphManager.toWURCS(g)
    rescue WURCSException => e
      puts e.message
    rescue GraphManagerException => e
      puts e.message
    end
  end

  java_import 'org.glycoinfo.subsumption.generator.BaseComposition'
  def baseComposition(w)
    g = nil
    begin
      g = BaseComposition.beBorn(GraphManager.toGraph(w))
      return GraphManager.toWURCS(g)
    rescue WURCSException => e
      puts e.message
    rescue GraphManagerException => e
      puts e.message
    end
  end
  end
end
