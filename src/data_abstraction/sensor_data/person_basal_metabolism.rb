module DataAbstraction::SensorData
  class PersonBasalMetabolism < Generic
    STANDARD_UNIT = "kcal"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = EnergyValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      EnergyValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 1300
              }
            })
    end
  end
end
