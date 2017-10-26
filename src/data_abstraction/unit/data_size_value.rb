module DataAbstraction::Unit
  class DataSizeValue < Generic
    STANDARD_UNIT = "B"
    UNITS = [
             [ "B", "Byte",   "B", "byte" ],
             [ "KB", "KByte", "KB", "Kbyte" ],
             [ "MB", "MByte", "MB", "Mbyte" ],
             [ "GB", "GByte", "GB", "Gbyte" ],
             [ "TB", "TByte", "TB", "Tbyte" ],
             [ "PB", "PByte", "PB", "Pbyte" ],
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
      when "KB"
        DataSizeValue.new(@value * 1024, STANDARD_UNIT)
      when "MB"
        DataSizeValue.new(@value * 1048576, STANDARD_UNIT)
      when "GB"
        DataSizeValue.new(@value * 1073741824, STANDARD_UNIT)
      when "TB"
        DataSizeValue.new(@value * 1099511627776, STANDARD_UNIT)
      when "PB"
        DataSizeValue.new(@value * 1125899906842624, STANDARD_UNIT)
      else
        self
      end
    end
    def to_requested(unit = STANDARD_UNIT)
      if ( unit != @unit )
        standard = self.to_standard
        case @@unit_table[unit]
        when "KB"
          DataSizeValue.new(standard.value / 1024.0, unit)
        when "MB"
          DataSizeValue.new(standard.value / 1048576.0, unit)
        when "GB"
          DataSizeValue.new(standard.value / 1073741824.0, unit)
        when "TB"
          DataSizeValue.new(standard.value / 1099511627776.0, unit)
        when "PB"
          DataSizeValue.new(standard.value / 1125899906842624.0, unit)
        when "B"
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
