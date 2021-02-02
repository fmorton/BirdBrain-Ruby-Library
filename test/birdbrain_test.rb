#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_minitest'

class BirdbrainTest < BirdbrainMinitest
  HUMMINGBIRD_TEST_DEVICE = 'A'
  FINCH_TEST_DEVICE = 'B'

  def test_version_number_available
    refute_nil Birdbrain::VERSION
  end
end
