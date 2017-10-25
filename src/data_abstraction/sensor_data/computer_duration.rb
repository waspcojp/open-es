module DataAbstraction::SensorData
  class ComputerDuration < Generic
    STANDARD_UNIT = "sec"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DurationValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      DurationValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy(entry=nil)
      if (!entry)
        super({
                'data_class_name' => self.name.split('::').last,
                'data' => {
                  'value' => 7
                }
              })
      else
        super(entry)
      end
    end
  end
end
