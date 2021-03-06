module DataAbstraction::SensorData
  class StepCount < Generic
    STANDARD_UNIT = "Step"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = StepValue.new(data['value'].to_i, @unit)
    end
    def self.unit_class
      StepValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 100
              }
            })
    end
  end
end
