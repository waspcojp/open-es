module DataAbstraction::SensorData
  class O2Concentration < Generic
    STANDARD_UNIT = "ppm"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = ConcentrationValue.new(data['value'].to_i, @unit)
    end
    def self.unit_class
      ConcentrationValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 75,
                'unit' => 'ppm' }
            })
    end
  end
end
