#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainHummingbirdTestSetup < BirdbrainMinitest
  def setup
    @hummingbird = BirdbrainHummingbird.new(BirdbrainTest::HUMMINGBIRD_TEST_DEVICE)
  end

  def after_teardown
    @hummingbird.disconnect

    super
  end
end
