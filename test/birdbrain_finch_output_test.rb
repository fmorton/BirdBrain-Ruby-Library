#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainFinchOutputTest < BirdbrainFinchTestSetup
  def test_finch_output_beak
    assert @finch.beak(0, 60, 70)
    sleep(1)
    assert @finch.beak(0, 0, 0)
    sleep(1)
  end
end
