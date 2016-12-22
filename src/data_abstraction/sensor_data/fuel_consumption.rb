module DataAbstraction::SensorData
  class FuelConsumption < Generic
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
  end
  class AimingFuelConsumption < FuelConsumption
  end
  class MaxFuelConsumption_10_15 < FuelConsumption
  end
  class MaxFuelConsumption_JC08 < FuelConsumption
  end
  class MinFuelConsumption_10_15 < FuelConsumption
  end
  class MinFuelConsumption_JC08 < FuelConsumption
  end
end
