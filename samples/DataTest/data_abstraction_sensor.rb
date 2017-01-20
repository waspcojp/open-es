require 'json'

$LOAD_PATH << "../../src"

require 'data_abstraction'

sensor_data = DataAbstraction::SensorData.constants.sort
sensor_data.delete(:Generic)
sensor_data.delete(:Undef)
sensor_data.each do | s |
  sensor_class = DataAbstraction::SensorData.const_get(s)
  val = sensor_class.dummy
  print sensor_class, "\n"
  print val.to_hash.to_json, "\n\n"
end
