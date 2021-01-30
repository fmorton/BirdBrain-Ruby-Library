#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainHummingbird < BirdbrainMicrobit
  VALID_LED_PORTS = '123'
  VALID_TRILED_PORTS = '12'
  VALID_SENSOR_PORTS = '123'
  VALID_SERVO_PORTS = '1234'

  def light(port)
    BirdbrainHummingbirdInput.light(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def sound(port)
    BirdbrainHummingbirdInput.sound(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def distance(port)
    BirdbrainHummingbirdInput.distance(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def dial(port)
    BirdbrainHummingbirdInput.dial(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def voltage(port)
    BirdbrainHummingbirdInput.voltage(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def position_servo(port, angle)
    BirdbrainHummingbirdOutput.position_servo(device, port, angle) if connected_and_valid?(port, VALID_SERVO_PORTS)
  end

  def rotation_servo(port, speed)
    BirdbrainHummingbirdOutput.rotation_servo(device, port, speed) if connected_and_valid?(port, VALID_SERVO_PORTS)
  end

  def led(port, intensity)
    BirdbrainHummingbirdOutput.led(device, port, intensity) if connected_and_valid?(port, VALID_LED_PORTS)
  end

  def tri_led(port, r_intensity, g_intensity, b_intensity)
    BirdbrainHummingbirdOutput.tri_led(device, port, r_intensity, g_intensity, b_intensity) if connected_and_valid?(port, VALID_TRILED_PORTS)
  end

  def play_note(note, beats)
    BirdbrainHummingbirdOutput.play_note(device, note, beats) if connected?
  end

  def orientation_screen_up?
    BirdbrainMicrobitInput.orientation_screen_up?(device) if connected?
  end

  def orientation_screen_down?
    BirdbrainMicrobitInput.orientation_screen_down?(device) if connected?
  end

  def orientation_tilt_left?
    BirdbrainMicrobitInput.orientation_tilt_left?(device) if connected?
  end

  def orientation_tilt_right?
    BirdbrainMicrobitInput.orientation_tilt_right?(device) if connected?
  end

  def orientation_logo_up?
    BirdbrainMicrobitInput.orientation_logo_up?(device) if connected?
  end

  def orientation_logo_down?
    BirdbrainMicrobitInput.orientation_logo_down?(device) if connected?
  end
end
