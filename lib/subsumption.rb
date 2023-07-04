require 'java'

require_relative 'jar/subsumption-0.9.5.jar'
require_relative 'jar/wurcsframework-1.2.13.jar'
require_relative 'jar/slf4j-api-2.0.6.jar'

java_import 'org.glycoinfo.subsumption.manipulation.GraphManager'
java_import 'org.glycoinfo.WURCSFramework.wurcs.graph.WURCSGraph'
java_import 'org.glycoinfo.subsumption.util.GraphManagerException'
java_import 'org.glycoinfo.WURCSFramework.util.WURCSException'
java_import 'org.slf4j.Logger'
java_import 'org.slf4j.LoggerFactory'
java_import 'org.glycoinfo.subsumption.generator.Topology'

module Subsumption

  def self.topology(w)
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
  def self.monosaccharideCompositionWithoutLinkage(w)
    g = nil
    begin
      g = MonosaccharideCompositionWithoutLinkage.beBorn(GraphManager.toGraph(w))
      return GraphManager.toWURCS(g)
    rescue WURCSException, GraphManagerException => e
      puts e.message
    end
  end

  java_import 'org.glycoinfo.subsumption.generator.CompositionWithLinkage'
  def self.compositionWithLinkage(w) #出来てる
    g = CompositionWithLinkage.beBorn(GraphManager.toGraph(w))
    return GraphManager.toWURCS(g)
  end

  java_import 'org.glycoinfo.subsumption.generator.BaseCompositionWithLinkage'
  def self.baseCompositionWithLinkage(w) #出来てる
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
  def self.baseComposition(w)
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
