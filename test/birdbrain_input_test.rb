#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainInputTest < Minitest::Test
  def test_input_get_light
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.get_light(1)
  end

  def test_input_get_sound
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.get_sound(1)
  end

  def test_input_get_distance
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.get_distance(1)
  end

  def test_input_get_dial
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.get_dial(1)
  end

  def test_input_get_voltage
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.get_voltage(1)
  end

  def test_input_shaking
    hummingbird = BirdbrainHummingbird.new

    assert_equal(hummingbird.shaking?, false)
  end
end
