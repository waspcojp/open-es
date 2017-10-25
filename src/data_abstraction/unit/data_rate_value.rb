module DataAbstraction::Unit
  class DataRateValue < Generic
    STANDARD_UNIT = "B/s"
    UNITS = [
             [ "B/s", "Byte/s",   "B/s", "Byte/sec", "byte/sec" ],
             [ "KB/s", "KByte/s", "KB/s", "KB/sec" ],
             [ "MB/s", "MByte/s", "MB/s", "MB/sec" ],
             [ "GB/s", "GByte/s", "GB/s", "GB/sec" ],
             [ "TB/s", "TByte/s", "TB/s", "TB/sec" ],
             [ "PB/s", "PByte/s", "PB/s", "PB/sec" ],
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
      when "KB/s"
        DataRateValue.new(@value * 1000.0, STANDARD_UNIT)
      when "MB/s"
        DataRateValue.new(@value * 1000000.0, STANDARD_UNIT)
      when "GB/s"
        DataRateValue.new(@value * 1000000000.0, STANDARD_UNIT)
      when "TB/s"
        DataRateValue.new(@value * 1000000000000.0, STANDARD_UNIT)
      when "PB/s"
        DataRateValue.new(@value * 1000000000000000.0, STANDARD_UNIT)
      else
        self
      end
    end
    def to_requested(unit = STANDARD_UNIT)
      if ( unit != @unit )
        standard = self.to_standard
        case @@unit_table[unit]
        when "KB/s"
          DataRateValue.new(@value / 1000.0, unit)
        when "MB/s"
          DataRateValue.new(@value / 1000000.0, unit)
        when "GB/s"
          DataRateValue.new(@value / 1000000000.0, unit)
        when "TB/s"
          DataRateValue.new(@value / 1000000000000.0, unit)
        when "PB/s"
          DataRateValue.new(@value / 1000000000000000.0, unit)
        when "B/s"
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
