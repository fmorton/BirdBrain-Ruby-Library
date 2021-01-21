#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainConnection
  DEFAULT_DEVICE = 'A'

  attr_accessor :connected
  attr_accessor :device

  def initialize(device = DEFAULT_DEVICE)
    self.device = device

    self.connected = BirdbrainRequest.connected?(device)
  end

  def connected?
    connected
  end

  def close
    self.device = nil
  end

  def microbit?
    BirdbrainMicrobitInput.microbit?(device) if connected?
  end

  def shaking?
    BirdbrainMicrobitInput.shaking?(device) if connected?
  end

  def microbit_display(led_list)
    BirdbrainMicrobitOutput.microbit_display(device, led_list) if connected?
  end

  def microbit_clear_display
    BirdbrainMicrobitOutput.microbit_clear_display(device) if connected?
  end

  def microbit_print(message)
    BirdbrainMicrobitOutput.microbit_print(device, message) if connected?
  end

  def get_light(port)
    BirdbrainInput.get_light(device, port) if connected?
  end

  def get_sound(port)
    BirdbrainInput.get_sound(device, port) if connected?
  end

  def get_distance(port)
    BirdbrainInput.get_distance(device, port) if connected?
  end

  def get_dial(port)
    BirdbrainInput.get_dial(device, port) if connected?
  end

  def get_voltage(port)
    BirdbrainInput.get_voltage(device, port) if connected?
  end

  def servo(port, angle)
    BirdbrainOutput.servo(device, port, angle) if connected?
  end

  def rotation_servo(port, speed)
    BirdbrainOutput.rotation_servo(device, port, speed) if connected?
  end

  def led(port, intensity)
    BirdbrainOutput.led(device, port, intensity) if connected?
  end

  def tri_led(port, r_intensity, g_intensity, b_intensity)
    BirdbrainOutput.tri_led(device, port, r_intensity, g_intensity, b_intensity) if connected?
  end

  def play_note(note, beats)
    BirdbrainOutput.play_note(device, note, beats) if connected?
  end
end
