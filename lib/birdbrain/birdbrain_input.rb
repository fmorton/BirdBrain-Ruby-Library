#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainInput < BirdbrainRequest
  def self.get_sensor(device, port, factor)
    response = response_body('hummingbird', 'in', 'sensor', port, device)

    (response.nil? ? nil : bounds((response.to_f * factor).to_i, 0, 100))
  end

  def self.get_light(device, port)
    get_sensor(device, port, 0.39215686274509803) # factor=100/255
  end

  def self.get_sound(device, port)
    get_sensor(device, port, 0.7843137254901961) # factor=200/255
  end

  def self.get_distance(device, port)
    get_sensor(device, port, 1.17) # factor=117/100
  end

  def self.get_dial(device, port)
    get_sensor(device, port, 0.43478260869565216) # factor=100/230
  end

  def self.get_voltage(device, port)
    get_sensor(device, port, 0.012941176470588235) # factor=3.3/255
  end
end
