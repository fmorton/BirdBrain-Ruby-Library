#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainInputTest < Minitest::Test
  def test_input_get_light
    birdbrain = BirdbrainConnection.new

    assert birdbrain.get_light(1)
  end

  def test_input_get_sound
    birdbrain = BirdbrainConnection.new

    assert birdbrain.get_sound(1)
  end

  def test_input_get_distance
    birdbrain = BirdbrainConnection.new

    assert birdbrain.get_distance(1)
  end

  def test_input_get_dial
    birdbrain = BirdbrainConnection.new

    assert birdbrain.get_dial(1)
  end

  def test_input_get_voltage
    birdbrain = BirdbrainConnection.new

    assert birdbrain.get_voltage(1)
  end

  def test_input_shaking
    birdbrain = BirdbrainConnection.new

    assert_equal(birdbrain.shaking?, false)
  end
end
