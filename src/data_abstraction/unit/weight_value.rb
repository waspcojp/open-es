module DataAbstraction::Unit
  class WeightValue < Generic
    STANDARD_UNIT = "kg"
    UNITS = [
             [ "micro_gram", "ug" ],
             [ "milli_gram", "mg" ],
             [ "kg", "Kg", "kg" ],
             [ "Mg", "Mg", "tonne" ],
             [ "Gg", "Gg" ],
             [ "Tg", "Tg" ]
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
      when "micro_gram"
        WeightValue.new(@value * 0.000000001, STANDARD_UNIT)
      when "milli_gram"
        WeightValue.new(@value * 0.000001, STANDARD_UNIT)
      when "gram"
        WeightValue.new(@value * 0.001, STANDARD_UNIT)
      when "Mg"
        WeightValue.new(@value * 1000.0, STANDARD_UNIT)
      when "Gg"
        WeightValue.new(@value * 1000000.0, STANDARD_UNIT)
      when "Tg"
        WeightValue.new(@value * 1000000000.0, STANDARD_UNIT)
      else
        self
      end
    end
    def to_requested(unit = STANDARD_UNIT)
      if ( unit != @unit )
        standard = self.to_standard
        case @@unit_table[unit]
        when "micro_gram"
          WeightValue.new(standard.value / 0.000000001, unit)
        when "milli_gram"
          WeightValue.new(standard.value / 0.000001, unit)
        when "gram"
          WeightValue.new(standard.value / 0.001, unit)
        when "kg"
          WeightValue.new(standard.value, unit)
        when "Mg"
          WeightValue.new(standard.value / 1000.0, unit)
        when "Gg"
          WeightValue.new(standard.value / 1000000.0, unit)
        when "Tg"
          WeightValue.new(standard.value / 1000000000.0, unit)
        else
          nil
        end
      else
        self
      end
    end
  end
end
