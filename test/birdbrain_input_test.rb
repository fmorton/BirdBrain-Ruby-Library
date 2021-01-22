#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test_setup'

class BirdbrainInputTest < BirdbrainTestSetup
  def test_input_hummingbird?
    assert @hummingbird.hummingbird?
  end

  def test_input_get_light
    assert @hummingbird.get_light(1)
  end

  def test_input_get_sound
    assert @hummingbird.get_sound(1)
  end

  def test_input_get_distance
    assert @hummingbird.get_distance(1)
  end

  def test_input_get_dial
    assert @hummingbird.get_dial(1)
  end

  def test_input_get_voltage
    assert @hummingbird.get_voltage(1)
  end

  def test_input_microbit_shaking
    assert_equal(@hummingbird.microbit_shaking?, false)
  end
end
