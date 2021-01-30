#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test_setup'

class BirdbrainInputTest < BirdbrainTestSetup
  def test_input_hummingbird?
    assert_true_or_false @hummingbird.hummingbird?
  end

  def test_input_hummingbird_light
    assert @hummingbird.light(1)
  end

  def test_input_hummingbird_sound
    assert @hummingbird.sound(1)
  end

  def test_input_hummingbird_distance
    assert @hummingbird.distance(1)
  end

  def test_input_hummingbird_dial
    assert @hummingbird.dial(1)
  end

  def test_input_hummingbird_voltage
    assert @hummingbird.voltage(1)
  end
end
