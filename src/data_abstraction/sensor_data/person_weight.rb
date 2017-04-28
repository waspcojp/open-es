module DataAbstraction::SensorData
  class PersonWeight < Generic
    STANDARD_UNIT = "kg"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = WeightValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      WeightValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 75.2
              }
            })
    end
  end
end
