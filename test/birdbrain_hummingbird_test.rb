#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainHummingbirdTest < BirdbrainHummingbirdTestSetup
  def test_connection
    assert @hummingbird.device == BirdbrainHummingbird::DEFAULT_DEVICE
    assert @hummingbird.connected?
  end
end
