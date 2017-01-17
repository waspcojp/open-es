module DataAbstraction::SensorData
  class GasMileage < Generic
    STANDARD_UNIT = "km/L"
    def initialize(data, meta_values = {}, unit = STANDARD_UNIT)
      super(data, meta_values, unit)
      @value = FuelConsumptionValue.new(data['value'].to_f, @unit)
    end
    def self.unit_class
      FuelConsumptionValue
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def self.dummy(entry=nil)
      if (!entry)
        super({
                'data_class_name' => self.name.split('::').last,
                'data' => {
                  'value' => 12,
                  'unit' => 'km/L' }
              })
      else
        super(entry)
      end
    end
  end
  class AimingGasMileage < GasMileage
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 16,
                'unit' => 'km/L' }
            })
    end
  end
  class ActualGasMileage < GasMileage
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 15.48476,
                'unit' => 'km/L' }
            })
    end
  end
  class MaxGasMileage_10_15 < GasMileage
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 19.3,
                'unit' => 'km/L' }
            })
    end
  end
  class MaxGasMileage_JC08 < GasMileage
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 26.2,
                'unit' => 'km/L' }
            })
    end
  end
  class MinGasMileage_10_15 < GasMileage
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 19.3,
                'unit' => 'km/L' }
            })
    end
  end
  class MinGasMileage_JC08 <  GasMileage
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 21.9,
                'unit' => 'km/L' }
            })
    end
  end
end
