module DataAbstraction::SensorData
  class CarDisplacement < Generic
    STANDARD_UNIT = "cc"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = VolumeValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      VolumeValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 1800,
                'unit' => 'cc' }
            })
    end
  end
end
