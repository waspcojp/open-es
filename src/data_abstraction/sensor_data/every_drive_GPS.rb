module DataAbstraction::SensorData
  class EveryDrive_GPS < Generic
    STANDARD_UNIT = "degree"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @values = Hash.new
      @values['groundspeed'] = SpeedValue.new(data['groundspeed'].to_f)
      @values['groundcourse'] = DirectionValue.new(data['groundcourse'].to_f)
      @values['hdop'] = RateValue.new(data['hdop'].to_f)
      @values['latidude'] = LocationValue.new(data['latitude'].to_f)
      @values['longitude'] = LocationValue.new(data['longitude'].to_f)
      @values['elevation'] = DimensionValue.new(data['elevation'].to_f)
      @values['satellite_supplements'] = CountValue.new(data['satellite_supplements'])
      @values['Positioning_status'] = CountValue.new(data['Positioning_status'])
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
                'longitude' => 139.73378,
                'latitude' => 35.691873,
                'elevation' => 5.0,
                'groundspeed' => 0.0,
                'groundcourse' => 141.1,
                'hdop': 3.4,
                'satellite_supplements' => 7,
                'Positioning_status' => 1
              }
            })
    end
  end
end
