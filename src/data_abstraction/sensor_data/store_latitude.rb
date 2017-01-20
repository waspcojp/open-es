# coding: utf-8
module DataAbstraction::SensorData
  class StoreLatitude < Generic
    STANDARD_UNIT = "degree"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = LocationValue.new(data['value'], unit)
    end
    def self.unit_class
      LocationValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 12.345678
              }
            })
    end
  end
end
