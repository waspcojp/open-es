module DataAbstraction::SensorData
  class CarModelComment < Generic
    STANDARD_UNIT = nil
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = SimpleString.new(data['value'])
    end
    def self.unit_class
      SimpleString
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 'CarModelComment'
              }
            })
    end
  end
end
