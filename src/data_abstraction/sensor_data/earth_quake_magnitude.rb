module DataAbstraction::SensorData
  class  EarthQuakeMagnitude < Generic
    STANDARD_UNIT = "M"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = MagnitudeValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      MagnitudeValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 5.2,
                'unit' => 'M' }
            })
    end
  end
end
