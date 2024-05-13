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

    def to_graph(w)
      g = nil
      wgn = WURCSGraphNormalizer.new
      begin
        factory = WURCSFactory.new(w)
        g = factory.getGraph
        wgn.start(g)
      rescue WURCSException => e
        e.printStackTrace
      end
      return g
    end
    
    def get_anomeric_status(a_o_backbone)
      a_o_backbone.get_backbone_carbons.each do |t_o_bc|
        return "archetype_anomer" if t_o_bc.get_descriptor.get_char.chr == 'u'
        return "archetype_anomer" if t_o_bc.get_descriptor.get_char.chr == 'U'
      end
      return "anomer_unknown" if a_o_backbone.get_anomeric_symbol.chr == 'x'
      return "anomer_alpha" if a_o_backbone.get_anomeric_symbol.chr == 'a'
      return "anomer_beta" if a_o_backbone.get_anomeric_symbol.chr == 'b'
      return "openchain" if a_o_backbone.get_anomeric_position != 0
      return nil
    end

    def get_ring_type(a_o_backbone)
      a_o_backbone.get_backbone_carbons.each do |t_o_bc|
        return "archetype_ringtype" if t_o_bc.get_descriptor.get_char.chr == 'u'
        return "archetype_ringtype" if t_o_bc.get_descriptor.get_char.chr == 'U'
      end
      for edge in a_o_backbone.get_edges 
        if edge.is_anomeric && edge.get_modification.is_ring
          ring_start = edge.get_linkages[0].get_backbone_position
          ring_end = edge.get_modification.get_edges[1].get_linkages[0].get_backbone_position
          if (ring_end - ring_start) == 6
            return "octanose"
          elsif (ring_end - ring_start) == 5
            return "septanose"
          elsif (ring_end - ring_start) == 4
            return "pyranose"
          elsif (ring_end - ring_start) == 3
            return "furanose"
          elsif (ring_end - ring_start) == 2
            return "oxetose"
          elsif (ring_end - ring_start) == 1
            return "oxirose"
          end
        end
      end
      return nil
    end

  end
end
