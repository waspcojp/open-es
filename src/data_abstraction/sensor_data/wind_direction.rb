module DataAbstraction::SensorData
  class WindDirection < Generic
    STANDARD_UNIT = "degree"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DirectionValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      DirectionValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 120,
                'unit' => 'degree'
              }
            })
    end
  end
end
