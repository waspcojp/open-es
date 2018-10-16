module DataAbstraction::SensorData
  class EveryDriveGyro < Generic
    STANDARD_UNIT = "deg/s"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @values = Array.new
      data['values'].each do | values |
        el = Array.new
        el[0] = AngularVelocityValue.new(values[0].to_f, @unit)
        el[1] = AngularVelocityValue.new(values[1].to_f, @unit)
        el[2] = AngularVelocityValue.new(values[2].to_f, @unit)
        @values << el
      end
    end
    def self.unit_class
      DataAbstraction::Unit::LocationValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'values' => [
                             [-0.3662109375,-0.152587890625,0.67138671875],
                             [-1.5869140625,-0.152587890625,-1.15966796875],
                             [0.640869140625,-0.335693359375,-1.068115234375],
                             [-1.739501953125,0.152587890625,0.48828125],
                             [-2.8076171875,-0.67138671875,0.823974609375],
                             [1.64794921875,1.220703125,-2.777099609375],
                             [-4.058837890625,0,-3.570556640625],
                             [-1.953125,-2.0751953125,-3.265380859375],
                             [-0.54931640625,-2.44140625,-2.44140625],
                             [-3.90625,-1.220703125,-0.152587890625]],
                'unit' => 'deg/s' }
            })
    end
  end
end
