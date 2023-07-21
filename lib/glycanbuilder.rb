require 'java'

require_relative 'jar/glycanbuilder2.jar'
require_relative 'jar/wurcsframework.jar'
require_relative 'jar/slf4j-api.jar'
require_relative "jar/batik-all.jar"

java_import 'java.io.ByteArrayOutputStream'
java_import 'java.util.Base64'
java_import 'javax.imageio.ImageIO'
java_import 'org.eurocarbdb.application.glycanbuilder.BuilderWorkspace'
java_import 'org.eurocarbdb.application.glycanbuilder.massutil.MassOptions'
java_import 'org.eurocarbdb.application.glycanbuilder.renderutil.GlycanRendererAWT'
java_import 'org.eurocarbdb.application.glycanbuilder.utill.GraphicOptions'
java_import 'org.glycoinfo.application.glycanbuilder.converterWURCS2.WURCS2Parser'

java_import 'org.eurocarbdb.application.glycanbuilder.renderutil.SVGUtils'



module GlycanBuilder
  def self.generatePng(w)
      workspace = BuilderWorkspace.new(GlycanRendererAWT.new)
  workspace.initData()
  workspace.setNotation(GraphicOptions::NOTATION_SNFG)
  parser= WURCS2Parser.new
  begin
    glycan = parser.readGlycan(w, MassOptions.new)
    image = workspace.getGlycanRenderer().getImage(glycan, true, false, true)
    stream = ByteArrayOutputStream.new
    ImageIO.write(image, "png", stream)
    base = Base64.getEncoder().encodeToString(stream.toByteArray())
    return "<img src=\"data:image/png;base64," + base + "\">", mime: 'text/html'
  rescue => e
       puts e.message
  end
  end
  
  def self.generateSvg(wurcs) 
  workspace = BuilderWorkspace.new(GlycanRendererAWT.new)
  workspace.initData()
  workspace.setNotation(GraphicOptions::NOTATION_SNFG)

  begin
    glycan = WURCS2Parser.new.readGlycan(wurcs, MassOptions.new)
    glycans = java.util.LinkedList.new
    glycans.add(glycan)

    return util.SVGUtils.getVectorGraphics(workspace.getGlycanRenderer, glycans, false, true)
  rescue Exception => e
puts e.message
    return e.to_s
  rescue StackOverflowError => e
puts e.message
    return e.to_s
  end
end
end
