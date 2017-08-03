module DataAbstraction::SensorData
  class CurrencyRate < Generic
    STANDARD_UNIT = "JPY"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = CurrencyValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      CurrencyValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 110,
                'unit' => 'JPY'
              }
            })
    end
  end
end
