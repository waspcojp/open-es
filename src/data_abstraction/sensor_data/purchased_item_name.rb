module DataAbstraction::SensorData
  class PurchasedItemName < Generic
    STANDARD_UNIT = nil
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = SimpleString.new(data['value'])
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
                  'value' => 'PurchasedItemName'
                }
              })
      else
        super(entry)
      end
    end
  end
  class PurchasedItemName1 < PurchasedItemName
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 'PurchasedItemName1'
              }
            })
    end
  end
  class PurchasedItemName2 < PurchasedItemName
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 'PurchasedItemName2'
              }
            })
    end
  end
  class PurchasedItemName3 < PurchasedItemName
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 'PurchasedItemName3'
              }
            })
    end
  end
  class PurchasedItemName4 < PurchasedItemName
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 'PurchasedItemName4'
              }
            })
    end
  end
end
