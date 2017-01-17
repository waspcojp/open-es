module DataAbstraction::SensorData
  class PersonTravelDistance < Generic
    STANDARD_UNIT = "Km"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DimensionValue.new(data['value'].to_i, @unit)
    end
    def self.unit_class
      DimensionValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 500
              }
            })
    end
  end
end
