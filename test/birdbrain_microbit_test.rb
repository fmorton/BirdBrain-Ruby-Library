#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainMicrobitTest < Minitest::Test
  def test_microbit
    birdbrain = BirdbrainConnection.new

    assert birdbrain.microbit?
  end

  def test_input_shaking
    birdbrain = BirdbrainConnection.new

    assert_equal(birdbrain.shaking?, false)
  end
end
