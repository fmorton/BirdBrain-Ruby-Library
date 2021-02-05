#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainHummingbirdTestSetup < BirdbrainMinitest
  def setup
    @hummingbird = BirdbrainFinch.find_device
    @hummingbird_connected = @hummingbird.connected?
  end

  def after_teardown
    @hummingbird.disconnect unless @hummingbird.nil?

    super
  end
end
