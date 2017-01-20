module DataAbstraction::SensorData
  class PurchasedItemID < Generic
    STANDARD_UNIT = nil
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = SimpleString.new(data['value'], @unit)
    end
    def self.unit_class
      SimpleString
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy(entry=nil)
      if (!entry)
        super({
                'data_class_name' => self.name.split('::').last,
                'data' => {
                  'value' => '12'
                }
              })
      else
        super(entry)
      end
    end
  end
  class PurchasedItemID1 < PurchasedItemID
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => '12'
              }
            })
    end
  end
  class PurchasedItemID2 < PurchasedItemID
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => '1234'
              }
            })
    end
  end
  class PurchasedItemID3 < PurchasedItemID
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => '1234567'
              }
            })
    end
  end
  class PurchasedItemID4 < PurchasedItemID
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => '1234567890'
              }
            })
    end
  end
end
