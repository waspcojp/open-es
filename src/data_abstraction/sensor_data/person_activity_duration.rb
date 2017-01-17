module DataAbstraction::SensorData
  class PersonActivityDuration < Generic
    STANDARD_UNIT = "minute"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DurationValue.new(data['value'].to_i, @unit)
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
  class PersonFairlyActiveDuration < PersonActivityDuration
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 20
              }
            })
    end
  end
  class PersonSedentaryDuration < PersonActivityDuration
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 20
              }
            })
    end
  end
  class PersonSleepDuration < PersonActivityDuration
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 8
              }
            })
    end
  end
  class PersonVeryActiveDuration < PersonActivityDuration
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 20
              }
            })
    end
  end
  class PersonLightlyActiveDuration < PersonActivityDuration
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 20
              }
            })
    end
  end
end
