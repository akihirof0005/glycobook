require 'rdf'
require 'rdf/turtle'

module GlycoBook
  class GlyCosmosRdfNamespace
    GLYTOUCAN = RDF::Vocabulary.new("http://rdf.glycoinfo.org/glycan/")
    GLYCAN = RDF::Vocabulary.new("http://purl.jp/bio/12/glyco/glycan#")
    RDF = RDF::Vocabulary.new("http://www.w3.org/1999/02/22-rdf-syntax-ns#")
  #  @@archetype_version = ENV['ARCHETYPE_VERSION']
    
    def self.saccharide(id)
      # Validate the input 'id'
      if id.nil? || id.empty?
        raise ArgumentError, "please assign 'id'"
      end
      return GLYTOUCAN[id]
    end
  
    def self.red_end_ms(id)
      # Validate the input 'id'
      if id.nil? || id.empty?
        raise ArgumentError, "please assign 'id'"
      end
      return GLYTOUCAN[id + "/red_end_ms"]
    end
  
    def self.has_reducing_end_monosaccharide_residue
      return GLYCAN["has_reducing_end_monosaccharide_residue"]
    end
  
    def self.anomeric_status(status)
      return GLYCAN[status]
    end
  
    def self.ring_status(status)
      return GLYCAN[status]
    end

    def self.has_ring_type
      return GLYCAN["has_ring_type"]
    end
    
    def self.has_archetype
      return GLYCAN["has_archetype"]
    end
  
    def self.has_anomer
      return GLYCAN["has_anomer"]
    end
    
    def self.is_archetype_of
      return GLYCAN["is_archetype_of"]
    end
    
    def self.type
      return RDF["type"]
    end
  
    def self.archetype
      return GLYCAN["Archetype"]
    end
  
  #  def self.generator_uri
  #    # Add error handling for missing or invalid ARCHETYPE_VERSION environment variable
  #    if @@archetype_version.nil? || @@archetype_version.empty?
  #      raise ArgumentError, "please assign 'archetype_version'"
  #    end
  #    # Return the URL for the 'generatorUri' based on the ARCHETYPE_VERSION environment variable
  #    return "https://glytoucan.org/api/archetype/#{@@archetype_version}/generator"
  #  end
    
    def self.has_message
      return "http://rdf.glycoinfo.org/glycan/archetype/logs#has_message"
    end
  end
  
end