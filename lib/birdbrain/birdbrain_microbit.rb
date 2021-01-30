#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainMicrobit < BirdbrainDevice
  VALID_BUTTONS = 'AB'

  def microbit_accelerometer
    BirdbrainMicrobitInput.microbit_accelerometer(device) if connected?
  end

  def microbit_compass
    BirdbrainMicrobitInput.microbit_compass(device) if connected?
  end

  def microbit_magnetometer
    BirdbrainMicrobitInput.microbit_magnetometer(device) if connected?
  end

  def microbit_button?(button)
    BirdbrainMicrobitInput.microbit_button?(device, button) if connected_and_valid?(button, VALID_BUTTONS)
  end

  def microbit_shaking?
    BirdbrainMicrobitInput.microbit_shaking?(device) if connected?
  end

  def microbit_orientation
    BirdbrainMicrobitInput.microbit_orientation(device) if connected?
  end

  def microbit_display(led_list)
    BirdbrainMicrobitOutput.microbit_display(state, device, led_list) if connected?
  end

  def microbit_clear_display
    BirdbrainMicrobitOutput.microbit_clear_display(state, device) if connected?
  end

  def microbit_point(x, y, value)
    BirdbrainMicrobitOutput.microbit_point(state, device, x, y, value) if connected?
  end

  def microbit_print(message)
    BirdbrainMicrobitOutput.microbit_print(device, message) if connected?
  end
end
