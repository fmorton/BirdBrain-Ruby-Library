#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainConnection
  DEFAULT_DEVICE = 'A'

  attr_accessor :device

  def initialize(device = DEFAULT_DEVICE)
    self.device = device
  end

  def close
    self.device = nil
  end
end
