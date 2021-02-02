#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainFinchTestSetup < BirdbrainMinitest
  def setup
    @finch = BirdbrainFinch.new(BirdbrainTest::FINCH_TEST_DEVICE)
  end

  def after_teardown
    @finch.disconnect

    super
  end
end
