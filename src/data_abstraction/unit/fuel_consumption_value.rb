module DataAbstraction::Unit
  class FuelConsumptionValue < Generic
    STANDARD_UNIT = "km/L"
    UNITS = [
             [ "m/L", "m/L", "M/L" ],
             [ "km/L", "km/L", "KM/L" ]
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
      when "m/L"
        ConcentrationValue.new(@value / 1000.0, STANDARD_UNIT)
      else
        self
      end
    end
    def to_requested(unit = STANDARD_UNIT)
      if ( unit != @unit )
        standard = self.to_standard
        case @@unit_table[unit]
        when "m/L"
          ConcentrationValue.new(standard.value * 1000.0, unit)
        else
          nil
        end
      else
        self
      end
    end
  end
end
