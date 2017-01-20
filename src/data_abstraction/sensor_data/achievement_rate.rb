module DataAbstraction::SensorData
  class AchievementRate < Generic
    STANDARD_UNIT = "%"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = RateValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      RateValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy(entry=nil)
      if (!entry)
        super({
                'data_class_name' => self.name.split('::').last,
                'data' => {
                  'value' => 74,
                  'unit' => '%'
                }
              })
      else
        super(entry)
      end
    end
  end
  class MinAchievementRate < AchievementRate
    def self.dummy
        super({
                'data_class_name' => self.name.split('::').last,
                'data' => {
                  'value' => 74,
                  'unit' => '%'
                }
              })
    end
  end
  class MaxAchievementRate < AchievementRate
    def self.dummy
        super({
                'data_class_name' => self.name.split('::').last,
                'data' => {
                  'value' => 74,
                  'unit' => '%'
                }
              })
    end
  end
  class MinAchievementRateJC08 < AchievementRate
    def self.dummy
        super({
                'data_class_name' => self.name.split('::').last,
                'data' => {
                  'value' => 85,
                  'unit' => '%'
                }
              })
    end
  end
  class MaxAchievementRateJC08 < AchievementRate
    def self.dummy
        super({
                'data_class_name' => self.name.split('::').last,
                'data' => {
                  'value' => 85,
                  'unit' => '%'
                }
              })
    end
  end
end
