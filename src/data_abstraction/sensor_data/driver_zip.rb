module DataAbstraction::SensorData
  class DriverZip < Generic
    STANDARD_UNIT = "JP-none"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = ZipString.new(data['value'])
    end
    def self.unit_class
      ZipString
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => '1070061'
              }
            })
    end
  end
end
