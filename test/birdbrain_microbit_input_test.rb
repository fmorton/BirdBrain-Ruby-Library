#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainMicrobitInputTest < Minitest::Test
  def test_microbit_input
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.microbit?
  end

  def test_microbit_input_shaking
    hummingbird = BirdbrainHummingbird.new

    assert_equal(hummingbird.shaking?, false)
  end
end
