require 'uri'
module DataAbstraction::SensorData
  class Camera < Generic
    STANDARD_UNIT = "jpeg"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      if ( data['filename'] )
        @filename = data['filename']
      else
        @value = Picture.new(data['value'], @unit)
      end
      if ( data['name'] )
        @name = data['name']
      end
    end
    def self.unit_class
      Picture
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def name
      @name
    end
    def to_simple_hash
      data = super
      if ( @filename )
        data['filename'] = @filename
      end
      if ( @value )
        data['value'] = @value.value
      end
      if ( @name )
        data['name'] = @name
      end
      data
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => nil,
                'unit' => STANDARD_UNIT
              }
            })
    end
  end
end
