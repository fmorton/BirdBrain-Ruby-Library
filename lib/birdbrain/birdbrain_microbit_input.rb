#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainMicrobitInput < BirdbrainRequest
  MICROBIT_ORIENTATIONS = ['Screen%20Up', 'Screen%20Down', 'Tilt%20Left', 'Tilt%20Right', 'Logo%20Up', 'Logo%20Down']
  MICROBIT_ORIENTATION_RESULTS = ['Screen up', 'Screen down', 'Tilt left', 'Tilt right', 'Logo up', 'Logo down', 'In between']
  MICROBIT_ORIENTATION_IN_BETWEEN = 'In between'

  def self.microbit?(device)
    request_status(response_body('hummingbird', 'in', 'isHummingbird', 'static', device))
  end

  def self.microbit_accelerometer(device)
    xyz_response(device, 'Accelerometer')
  end

  def self.microbit_compass(device)
    (response = response_body('hummingbird', 'in', 'Compass', device)).nil? ? response : response.to_i
  end

  def self.microbit_magnetometer(device)
    xyz_response(device, 'Magnetometer')
  end

  def self.microbit_button?(device, button)
    request_status(response_body('hummingbird', 'in', 'button', button, device))
  end

  def self.microbit_shaking?(device)
    request_status(response_body('hummingbird', 'in', 'orientation', 'Shake', device))
  end

  def self.microbit_orientation(device)
    MICROBIT_ORIENTATIONS.each_with_index do |orientation, index|
      return nil if (response = response_body('hummingbird', 'in', 'orientation', orientation, device)).nil?

      return MICROBIT_ORIENTATION_RESULTS[index] if request_status(response)
    end

    MICROBIT_ORIENTATION_IN_BETWEEN
  end

  def self.microbit_orientation_screen_up?(device)
    orientation_check(device, 0)
  end

  def self.microbit_orientation_screen_down?(device)
    orientation_check(device, 1)
  end

  def self.microbit_orientation_tilt_left?(device)
    orientation_check(device, 2)
  end

  def self.microbit_orientation_tilt_right?(device)
    orientation_check(device, 3)
  end

  def self.microbit_orientation_logo_up?(device)
    orientation_check(device, 4)
  end

  def self.microbit_orientation_logo_down?(device)
    orientation_check(device, 5)
  end

  private_class_method def self.orientation_check(device, index)
    request_status(response_body('hummingbird', 'in', 'orientation', MICROBIT_ORIENTATIONS[index], device))
  end
end
