module DataAbstraction::SensorData
  class GasChargeDate < Generic
    STANDARD_UNIT = "YYYYMMDD"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DateString.new(data['value'], @unit)
    end
    def self.unit_class
      DateString
    end
    def self.standard_unit
      STANDARD_UNIT
    end
  end
end
