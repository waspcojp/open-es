module DataAbstraction::SensorData
  class WaterFlowVolume < Generic
    STANDARD_UNIT = "L/s"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = FlowVolumeValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      FlowVolumeValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 4,
                'unit' => 'm^3/s'
              }
            })
    end
  end
end
