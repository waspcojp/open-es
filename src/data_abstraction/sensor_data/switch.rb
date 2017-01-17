module DataAbstraction::SensorData
  class Switch < Generic
    STANDARD_UNIT = nil
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      if  (( data['value'] =~ /^ON/i ) ||
           ( data['value'] =~ /^TRUE/i ) ||
           ( data['value'] == true ))
        @value = SymbolicValue.new(true)
      else
        @value = SymbolicValue.new(false)
      end
    end
    def self.unit_class
      SymbolicValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 'on'
              }
            })
    end
  end
end
