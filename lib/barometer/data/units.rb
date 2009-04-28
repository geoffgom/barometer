module Barometer
  class Units
    include Comparable
    
    attr_accessor :metric
    
    def initialize(metric=true)
      @metric = metric
    end
    
    #
    # HELPERS
    #
    
    def metric?
      @metric
    end
    
    def metric!
      @metric=true
    end
    
    def imperial!
      @metric=false
    end

    # assigns a value to the right attribute based on metric setting    
    def <<(value)
      return unless value
    
      begin
        if value.is_a?(Array)
          value_m = value[0].to_f
          value_i = value[1].to_f
          value_b = nil
        else
          value_m = nil
          value_i = nil
          value_b = value.to_f
        end
      rescue
        # do nothing
      end
    
      if self.metric?
        self.metric_default = value_m || value_b
      else
        self.imperial_default = value_i || value_b
      end
    end
    
    # STUB: define this method to actually retireve the metric_default
    def metric_default=(value)
      raise NotImplementedError
    end

    # STUB: define this method to actually retireve the imperial_default
    def imperial_default=(value)
      raise NotImplementedError
    end

  end
end