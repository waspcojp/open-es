module DataAbstraction::SensorData
  class PersonFloorNumber < Generic
    STANDARD_UNIT = "floor"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = CountValue.new(data['value'].to_i, @unit)
    end
    def self.unit_class
      CountValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 10
              }
            })
    end
  end
end
