require 'java'

require_relative 'jar/glycanformatconverter.jar'
require_relative 'jar/wurcsframework.jar'
require_relative 'jar/slf4j-api.jar'
require_relative "jar/MolecularFramework.jar"

java_import 'org.glycoinfo.GlycanFormatconverter.io.GlycoCT.WURCSToGlycoCT'
java_import 'org.glycoinfo.GlycanFormatconverter.io.IUPAC.IUPACStyleDescriptor'
java_import 'org.glycoinfo.GlycanFormatconverter.io.WURCS.WURCSImporter'
java_import 'org.glycoinfo.GlycanFormatconverter.util.ExporterEntrance'

class GlycanFormatConverter

def wurcs2iupac(wurcs,style)
  ret = {}
  ret["input"] =  wurcs
   
  begin
    wi = WURCSImporter.new
    gc = wi.start(wurcs)
    ee = ExporterEntrance.new(gc)

    if style == "condensed"
      iupaccondensed = ee.toIUPAC(IUPACStyleDescriptor::CONDENSED)
      ret["IUPACcondensed"] = iupaccondensed
    elsif style == "extended"
      iupacextended = ee.toIUPAC(IUPACStyleDescriptor::GREEK)
      ret["IUPACextended"] = iupacextended
    else
      glycam = ee.toIUPAC(IUPACStyleDescriptor::GLYCANWEB)
      ret["GLYCAM"] = glycam
    end

  rescue GlyCoExporterException, GlycanException, TrivialNameException, WURCSException => e
    logger.error("{}", e)
    ret["message"] = e.to_s
  rescue Exception => e
    logger.error("{}", e)
    ret["message"] = e.to_s
  end
  return ret
end

def wurcs2glycoct(wurcs)
    ret = {}
    ret["input"] =  wurcs
  begin
    converter = WURCSToGlycoCT.new
    converter.start(wurcs)
    message = converter.getErrorMessages
  if message.empty?
      ret["GlycoCT"] = converter.getGlycoCT
      ret["message"] = ""
    else
      ret["GlycoCT"] = ""
      ret["message"] = message
    end
      rescue Exception => e
              ret["GlycoCT"] = ""
    ret["message"] =  e.to_s
    end
  return ret
end

def wurcs2glycam(wurcs)
  wi = WURCSImporter.new
  ee = ExporterEntrance.new(wi.start(wurcs))
  begin
    ee.toIUPAC(IUPACStyleDescriptor::GLYCANWEB)
  rescue => e
    e.printStackTrace()
  end
end
end
