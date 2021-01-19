#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainConnection
  DEFAULT_DEVICE = 'A'

  attr_accessor :connected
  attr_accessor :device

  def initialize(device = DEFAULT_DEVICE)
    self.device = device

    # see if device is available
    self.connected = connected?
  end

  def connected?
    BirdbrainRequest.connected?(device)
  end

  def close
    self.device = nil
  end
end
