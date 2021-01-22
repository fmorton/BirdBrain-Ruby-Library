#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainMicrobitInput < BirdbrainRequest
  def self.microbit?(device)
    request_status(response_body('hummingbird', 'in', 'isHummingbird', 'static', device))
  end

  def self.microbit_accelerometer(device)
    microbit_xyz_values(device, 'Accelerometer')
  end

  def self.microbit_compass(device)
    response_body('hummingbird', 'in', 'Compass', device).to_i
  end

  def self.microbit_magnetometer(device)
    microbit_xyz_values(device, 'Magnetometer')
  end

  def self.microbit_shaking?(device)
    request_status(response_body('hummingbird', 'in', 'orientation', 'Shake', device))
  end

  def self.microbit_xyz_values(device, sensor)
    x = response_body('hummingbird', 'in', sensor, 'X', device).to_f
    y = response_body('hummingbird', 'in', sensor, 'Y', device).to_f
    z = response_body('hummingbird', 'in', sensor, 'Z', device).to_f

    [x, y, z]
  end
end
