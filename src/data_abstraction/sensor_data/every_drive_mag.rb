module DataAbstraction::SensorData
  class EveryDriveMag < Generic
    STANDARD_UNIT = "uT"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @values = Array.new
      data['values'].each do | values |
        el = Array.new
        el[0] = MagneticValue.new(values[0].to_f, @unit)
        el[1] = MagneticValue.new(values[1].to_f, @unit)
        el[2] = MagneticValue.new(values[2].to_f, @unit)
        @values << el
      end
    end
    def self.unit_class
      DataAbstraction::Unit::MagneticValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'values' => [
                             [-9.895970695970696,-25.18974358974359,-3.2986568986568985],
                             [-10.645665445665445,-24.73992673992674,-5.547741147741148],
                             [-10.645665445665445,-24.44004884004884,-4.048351648351648],
                             [-10.045909645909646,-24.73992673992674,-5.247863247863248],
                             [-9.446153846153846,-24.73992673992674,-5.247863247863248],
                             [-9.596092796092796,-24.58998778998779,-5.097924297924298],
                             [-9.446153846153846,-25.93943833943834,-4.048351648351648],
                             [-9.146275946275946,-26.23931623931624,-5.547741147741148],
                             [-10.795604395604396,-24.58998778998779,-2.998778998778999],
                             [-10.495726495726496,-26.98901098901099,-3.8984126984126983]],
                'unit' => 'uT' }
            })
    end
  end
end
