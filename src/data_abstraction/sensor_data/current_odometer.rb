module DataAbstraction::SensorData
  class CurrentOdometer < Generic
    STANDARD_UNIT = "km"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DimensionValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      DimensionValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
  end
end
