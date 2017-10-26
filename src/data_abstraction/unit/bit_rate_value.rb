module DataAbstraction::Unit
  class BitRateValue < Generic
    STANDARD_UNIT = "bps"
    UNITS = [
             [ "bps", "bps", "bit/sec" ],
             [ "Kbps", "kbps", "Kbps" ],
             [ "Mbps", "mbps", "Mbps" ],
             [ "Gbps", "gbps", "Gbps" ],
             [ "Tbps", "tbps", "Tbps" ],
             [ "Pbps", "pbps", "Pbps" ],
            ]
    @@unit_table = unit_table(UNITS)

    def initialize(value, unit = STANDARD_UNIT)
      unit = STANDARD_UNIT if ( !unit )
      if  ( @@unit_table[unit] )
        @value = value
        @unit = unit
      else
        raise RangeError, "invalid unit '#{unit}'"
      end
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def standard_unit
      STANDARD_UNIT
    end
    def self.units
      UNITS
    end
    def to_standard
      case @@unit_table[@unit]
      when "Kbps"
        BitRateValue.new(@value * 1000.0, STANDARD_UNIT)
      when "Mbps"
        BitRateValue.new(@value * 1000000.0, STANDARD_UNIT)
      when "Gbps"
        BitRateValue.new(@value * 1000000000.0, STANDARD_UNIT)
      when "Tbps"
        BitRateValue.new(@value * 1000000000000.0, STANDARD_UNIT)
      when "Pbps"
        BitRateValue.new(@value * 1000000000000000.0, STANDARD_UNIT)
      else
        self
      end
    end
    def to_requested(unit = STANDARD_UNIT)
      if ( unit != @unit )
        standard = self.to_standard
        case @@unit_table[unit]
        when "Kbps"
          BitRateValue.new(standard.value / 1000.0, unit)
        when "Mbps"
          BitRateValue.new(standard.value / 1000000.0, unit)
        when "Gbps"
          BitRateValue.new(standard.value / 1000000000.0, unit)
        when "Tbps"
          BitRateValue.new(standard.value / 1000000000000.0, unit)
        when "Pbps"
          BitRateValue.new(standard.value / 1000000000000000.0, unit)
        when "bps"
          standard
        else
          nil
        end
      else
        self
      end
    end
  end
end
