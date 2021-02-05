#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainHummingbirdTest < BirdbrainHummingbirdTestSetup
  def test_hummingbird_connection
    return unless @hummingbird_connected

    assert @hummingbird.device == BirdbrainHummingbird::DEFAULT_DEVICE
    assert @hummingbird.connected?
  end
end
