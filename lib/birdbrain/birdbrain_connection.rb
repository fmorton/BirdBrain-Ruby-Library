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

  def shaking?
    BirdbrainInput.shaking?(device) if connected?
  end

  def servo(port, angle)
    BirdbrainOutput.servo(device, port, angle) if connected?
  end

  def led(port, intensity)
    BirdbrainOutput.led(device, port, intensity) if connected?
  end

  def tri_led(port, r_intensity, g_intensity, b_intensity)
    BirdbrainOutput.tri_led(device, port, r_intensity, g_intensity, b_intensity) if connected?
  end
end
