module DataAbstraction::SensorData
  class SunF10_7 < Generic
    STANDARD_UNIT = ""
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = FigureValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      FigureValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 3
              }
            })
    end
  end
end
