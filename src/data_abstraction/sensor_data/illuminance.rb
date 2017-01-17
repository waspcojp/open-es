module DataAbstraction::SensorData
  class Illuminance < Generic
    STANDARD_UNIT = "lx"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = IlluminanceValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      IlluminanceValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 700,
                'unit' => 'lx' }
            })
    end
  end
end
