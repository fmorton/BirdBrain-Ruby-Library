#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainHummingbird
  DEFAULT_DEVICE = 'A'
  VALID_DEVICES = 'ABC'
  VALID_BUTTONS = 'AB'
  VALID_LED_PORTS = '123'
  VALID_TRILED_PORTS = '12'
  VALID_SENSOR_PORTS = '123'
  VALID_SERVO_PORTS = '1234'

  attr_accessor :state
  attr_accessor :connected
  attr_accessor :device

  def initialize(device = DEFAULT_DEVICE)
    raise(BirdbrainException, 'Missing device name') if device.nil?
    raise(BirdbrainException, "Invalid device name: #{device}") unless VALID_DEVICES.include?(device)

    self.state = BirdbrainState.new
    self.device = device
    self.connected = BirdbrainRequest.connected?(device)

    raise BirdbrainException('No connection') unless connected?
  end

  def connected?
    connected
  end

  def stop_all
    BirdbrainOutput.stop_all(device) if connected?

    state.microbit_display_map_clear unless state.nil?

    self.connected = false
    self.device = nil
    self.state = nil
  end

  def hummingbird?
    BirdbrainInput.hummingbird?(device) if connected?
  end

  def microbit?
    BirdbrainMicrobitInput.microbit?(device) if connected?
  end

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

  def microbit_orientation_screen_up?
    BirdbrainMicrobitInput.microbit_orientation_screen_up?(device) if connected?
  end

  def microbit_orientation_screen_down?
    BirdbrainMicrobitInput.microbit_orientation_screen_down?(device) if connected?
  end

  def microbit_orientation_tilt_left?
    BirdbrainMicrobitInput.microbit_orientation_tilt_left?(device) if connected?
  end

  def microbit_orientation_tilt_right?
    BirdbrainMicrobitInput.microbit_orientation_tilt_right?(device) if connected?
  end

  def microbit_orientation_logo_up?
    BirdbrainMicrobitInput.microbit_orientation_logo_up?(device) if connected?
  end

  def microbit_orientation_logo_down?
    BirdbrainMicrobitInput.microbit_orientation_logo_down?(device) if connected?
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

  def light(port)
    BirdbrainInput.light(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def sound(port)
    BirdbrainInput.sound(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def distance(port)
    BirdbrainInput.distance(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def dial(port)
    BirdbrainInput.dial(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def voltage(port)
    BirdbrainInput.voltage(device, port) if connected_and_valid?(port, VALID_SENSOR_PORTS)
  end

  def servo(port, angle)
    BirdbrainOutput.servo(device, port, angle) if connected_and_valid?(port, VALID_SERVO_PORTS)
  end

  def rotation_servo(port, speed)
    BirdbrainOutput.rotation_servo(device, port, speed) if connected_and_valid?(port, VALID_SERVO_PORTS)
  end

  def led(port, intensity)
    BirdbrainOutput.led(device, port, intensity) if connected_and_valid?(port, VALID_LED_PORTS)
  end

  def tri_led(port, r_intensity, g_intensity, b_intensity)
    BirdbrainOutput.tri_led(device, port, r_intensity, g_intensity, b_intensity) if connected_and_valid?(port, VALID_TRILED_PORTS)
  end

  def play_note(note, beats)
    BirdbrainOutput.play_note(device, note, beats) if connected?
  end

  def connected_and_valid?(validate, valid_range)
    return true if !validate.nil? && valid_range.include?(validate.to_s) && connected?

    calling_method = caller[0]

    message = (calling_method == 'button') ? "Invalid button: #{validate}" : "Invalid #{calling_method} port: #{validate}"

    raise(BirdbrainException, message)
  end
end
