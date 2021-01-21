#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test_setup'

class BirdbrainMicrobitInputTest < BirdbrainTestSetup
  def test_microbit_input
    assert @hummingbird.microbit?
  end

  def test_microbit_input_shaking
    assert_equal(@hummingbird.shaking?, false)
  end
end
