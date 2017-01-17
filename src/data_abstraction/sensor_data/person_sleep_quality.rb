module DataAbstraction::SensorData
  class PersonSleepQuality < Undef
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 'raw'
              }
            })
    end
  end
end
