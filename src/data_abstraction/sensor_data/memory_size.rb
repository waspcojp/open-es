module DataAbstraction::SensorData
  class MemorySize < Generic
    STANDARD_UNIT = "KB"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DataSizeValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      DataSizeValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 15,
                'unit' => 'MB' }
            })
    end
  end
end
