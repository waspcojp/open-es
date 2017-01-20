module DataAbstraction::SensorData
  class CarReleaseTime < Generic
    STANDARD_UNIT = "YYYYMM"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DateString.new(data['value'], @unit)
    end
    def self.unit_class
      DateString
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => '201601'
              }
            })
    end
  end
end
