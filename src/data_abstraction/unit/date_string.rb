module DataAbstraction::Unit
  class DateString < Generic
    STANDARD_UNIT = "YYYYMMDD"
    UNITS = [
             [ "YYYYMMDD", "YYYYMMDD", "yyyymmdd", "YYYY/MM/DD" ],
             [ "YYYYMM", "YYYYMM", "yyyymm" ],
             [ "YYYY", "YYYY", "yyyy" ],
             [ "MM", "MM", "mm" ],
             [ "DD", "DD", "dd" ]
            ]
    @@unit_table = unit_table(UNITS)

    def initialize(value, unit = STANDARD_UNIT)
      @value = value
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
      self
    end
    def to_requested(unit = STANDARD_UNIT)
      standard = self.to_standard
    end
  end
end
