module DataAbstraction::SensorData
  class PersonMuscleRate < Generic
    STANDARD_UNIT = "%"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = RateValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      RateValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 33.0
              }
            })
    end
  end
end
