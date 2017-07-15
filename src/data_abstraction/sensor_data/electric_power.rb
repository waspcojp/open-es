module DataAbstraction::SensorData
  class ElectricPower < Generic
    STANDARD_UNIT = "KW"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = PowerValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      PowerValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 25,
                'unit' => 'KW' }
            })
    end
  end
end
