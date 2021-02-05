#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainFinchTestSetup < BirdbrainMinitest
  def setup
    @finch = BirdbrainFinch.find_device
    @finch_connected = @finch.connected?
  end

  def after_teardown
    @finch.disconnect unless @finch.nil?

    super
  end
end
