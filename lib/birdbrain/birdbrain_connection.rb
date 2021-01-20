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
    BirdbrainInput.shaking?(device)
  end

  def led(port, intensity)
    BirdbrainOutput.led(device, port, intensity)
  end
end
