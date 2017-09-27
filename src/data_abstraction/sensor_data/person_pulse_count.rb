module DataAbstraction::SensorData
  class PersonPulseCount < Generic
    STANDARD_UNIT = "bpm"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = CycleValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      CycleValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 75
              }
            })
    end
  end
end
