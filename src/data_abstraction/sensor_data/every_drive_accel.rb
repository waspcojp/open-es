module DataAbstraction::SensorData
  class EveryDriveAccel < Generic
    STANDARD_UNIT = "g"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @values = Array.new
      data['values'].each do | values |
        el = Array.new
        el[0] = AccelerationValue.new(values[0].to_f, @unit)
        el[1] = AccelerationValue.new(values[1].to_f, @unit)
        el[2] = AccelerationValue.new(values[2].to_f, @unit)
        @values << el
      end
    end
    def self.unit_class
      DataAbstraction::Unit::AccelerationValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'values' => [
                             [-0.0926513671875,0.8177490234375,0.607421875],
                             [-0.1004638671875,0.81640625,0.608154296875],
                             [-0.096435546875,0.8177490234375,0.6094970703125],
                             [-0.0911865234375,0.8148193359375,0.6153564453125],
                             [-0.090087890625,0.81591796875,0.6126708984375],
                             [-0.104248046875,0.8138427734375,0.6123046875],
                             [-0.1083984375,0.8070068359375,0.619140625],
                             [-0.104736328125,0.813232421875,0.611328125],
                             [-0.1016845703125,0.808837890625,0.615234375],
                             [-0.1103515625,0.805419921875,0.6268310546875]],
                'unit' => 'g' }
            })
    end
  end
end
