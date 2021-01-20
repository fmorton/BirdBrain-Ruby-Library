#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainMicrobitInputTest < Minitest::Test
  def test_microbit_input
    birdbrain = BirdbrainConnection.new

    assert birdbrain.microbit?
  end

  def test_microbit_input_shaking
    birdbrain = BirdbrainConnection.new

    assert_equal(birdbrain.shaking?, false)
  end
end
