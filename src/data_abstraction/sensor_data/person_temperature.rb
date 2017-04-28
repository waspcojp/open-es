module DataAbstraction::SensorData
  class PersonTemperature < Generic
    STANDARD_UNIT = "degree Celsius"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = TemperatureValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      TemperatureValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 24,
                'unit' => 'degree Celsius'
              }
            })
    end
  end
end
