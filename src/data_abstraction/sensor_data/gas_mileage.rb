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
  end
  class AimingGasMileage < GasMileage
  end
  class ActualGasMileage < GasMileage
  end
  class MaxGasMileage_10_15 < GasMileage
  end
  class MaxGasMileage_JC08 < GasMileage
  end
  class MinGasMileage_10_15 < GasMileage
  end
  class MinGasMileage_JC08 <  GasMileage
  end
end
