#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainFinchTest < BirdbrainFinchTestSetup
  def test_connection
    assert @finch.device == BirdbrainFinch::DEFAULT_DEVICE
    assert @finch.connected?
  end
end