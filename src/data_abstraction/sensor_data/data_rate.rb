module DataAbstraction::SensorData
  class DataRate < Generic
    STANDARD_UNIT = "B/s"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DataRateValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      DataRateValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 80,
                'unit' => 'KB/s'
               }
            })
    end
  end
end
