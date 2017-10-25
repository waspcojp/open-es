module DataAbstraction::Unit
  class RateValue < Generic
    STANDARD_UNIT = "%"
    UNITS = [
             [ "",        "" ],
             [ "percent", "%" ],
             [ "permil",  "permil" ],
             [ "ppm",     "ppm", "PPM" ],
             [ "ppb",     "ppb", "PPB" ]
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
      when ""
        RateValue.new(@value * 100.0, STANDARD_UNIT)
      when "permil"
        RateValue.new(@value / 10.0, STANDARD_UNIT)
      when "ppm"
        RateValue.new(@value / 10000.0, STANDARD_UNIT)
      when "ppb"
        RateValue.new(@value / 10000000.0, STANDARD_UNIT)
      else
        self
      end
    end
    def to_requested(unit = STANDARD_UNIT)
      if ( unit != @unit )
        standard = self.to_standard
        case @@unit_table[unit]
        when ""
          RateValue.new(standard.value / 100.0, unit)
        when "permil"
          RateValue.new(standard.value * 10.0, unit)
        when "ppm"
          RateValue.new(standard.value * 10000.0, unit)
        when "ppb"
          RateValue.new(standard.value * 10000000.0, unit)
        when "percent"
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
