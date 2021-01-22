#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test_setup'

class BirdbrainInputTest < BirdbrainTestSetup
  def test_input_hummingbird?
    assert @hummingbird.hummingbird?
  end

  def test_input_light
    assert @hummingbird.light(1)
  end

  def test_input_sound
    assert @hummingbird.sound(1)
  end

  def test_input_distance
    assert @hummingbird.distance(1)
  end

  def test_input_dial
    assert @hummingbird.dial(1)
  end

  def test_input_voltage
    assert @hummingbird.voltage(1)
  end

  def test_input_microbit_shaking
    assert_equal(@hummingbird.microbit_shaking?, false)
  end
end
