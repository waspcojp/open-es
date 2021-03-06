module DataAbstraction::SensorData
  class AngularVelocity < Generic
    STANDARD_UNIT = "deg/s"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @values = Array.new
      @values[0] = AngularVelocityValue.new(data['values'][0].to_f, @unit)
      @values[1] = AngularVelocityValue.new(data['values'][1].to_f, @unit)
      @values[2] = AngularVelocityValue.new(data['values'][2].to_f, @unit)
    end
    def self.unit_class
      AngularVelocityValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'values' => [-0.3662109375,-0.152587890625,0.67138671875],
                'unit' => 'deg/s' }
            })
    end
  end
end
