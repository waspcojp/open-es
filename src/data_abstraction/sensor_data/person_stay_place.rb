module DataAbstraction::SensorData
  class PersonStayPlace < Undef
    def self.dummy
      super({
              'data_class_name' => self.name.split('::').last,
              'data' => {
                'sensor' => 'aaabbbcccddd',
                'receiver' => "XXXX"
              }
            })
    end
  end
end
