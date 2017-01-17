# coding: utf-8
module DataAbstraction::SensorData
  class MaintenanceLevel < Generic
    STANDARD_UNIT = nil
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = SymbolicValue.new(data['value'])
    end
    def self.unit_class
      SymbolicValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => '壊れない程度で'
              }
            })
    end
  end
end
