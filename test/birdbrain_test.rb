#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test_setup'

class BirdbrainTest < BirdbrainTestSetup
  def test_version_number_available
    refute_nil Birdbrain::VERSION
  end

  def test_connection
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.device == BirdbrainHummingbird::DEFAULT_DEVICE
    assert hummingbird.connected?

    assert true
  end
end
