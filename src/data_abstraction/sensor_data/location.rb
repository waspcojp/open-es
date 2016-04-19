module DataAbstraction::SensorData
  class Location < Generic
    STANDARD_DATUM = "WGS84"
    DATUMS = [
              [ "wgs84", "WGS84" ],
              [ "jgd2000", "JGD2000" ],
              [ "jgd2011", "JGD2011" ],
              [ "tokyo", "Tokyo Datum" ]
             ]

    def self.datum_table(a)
      h = Hash.new
      a.each do | ent |
        val = ent[0]
        ent[1..-1].each do | e |
          h[e] = val
        end
      end
      h
    end
    @@datum_table = datum_table(DATUMS)
    def initialize(data, meta_values = {})
      super(data, meta_values)
      @value = DataAbstraction::Location.new(data)
    end
    def build_part
      "\"values\":[#{@value.values[0].value},#{@value.values[1].value},#{@value.values[2].value}],\"unit\":\"#{@value.unit}\",\"datum\":\"#{@value.datum}\""
    end
    def self.unit_class
      DataAbstraction::Unit::LocationValue
    end
  end
end
