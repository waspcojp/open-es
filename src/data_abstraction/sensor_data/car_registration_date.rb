module DataAbstraction::SensorData
  class CarRegistrationDate < Generic
    STANDARD_UNIT = "YYYYMM"
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
