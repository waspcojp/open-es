module DataAbstraction::SensorData
  class PersonBloodPressure < Generic
    STANDARD_UNIT = "mmHg"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = PressureValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      PressureValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 110
              }
            })
    end
  end
end
