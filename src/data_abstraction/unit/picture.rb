module DataAbstraction::Unit
  class Picture < Generic
    STANDARD_UNIT = "raw"
    UNITS =
      [
        [ "raw", "raw" ],
        [ "jpeg", "jpeg", "JPEG", "JPG" ],
        [ "png", "png", "PNG" ],
      ]
    @@unit_table = unit_table(UNITS)

    def initialize(value, unit = STANDARD_UNIT)
      @value = value
      @unit = unit
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
      self
    end
  end
end
