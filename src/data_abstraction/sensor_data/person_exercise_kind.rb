module DataAbstraction::SensorData
  class PersonExerciseKind < Undef
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'value' => 'running'
              }
            })
    end
  end
end
