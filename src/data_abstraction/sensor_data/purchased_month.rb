module DataAbstraction::SensorData
  class PurchasedMonth < Generic
    STANDARD_UNIT = "MM"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = DateString.new(data['value'], @unit)
    end
    def self.unit_class
      DateString
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => '1'
              }
            })
    end
  end
end
