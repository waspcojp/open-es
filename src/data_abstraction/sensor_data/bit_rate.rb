module DataAbstraction::SensorData
  class BitRate < Generic
    STANDARD_UNIT = "bps"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = BitRateValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      BitRateValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 80,
                'unit' => 'Kbps'
               }
            })
    end
  end
end
