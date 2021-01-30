#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainHummingbirdInputTest < BirdbrainHummingbirdTestSetup
  def test_hummingbird_input?
    assert_true_or_false @hummingbird.hummingbird?
  end

  def test_hummingbird_input_light
    assert @hummingbird.light(1)
  end

  def test_hummingbird_input_sound
    assert @hummingbird.sound(1)
  end

  def test_hummingbird_input_distance
    assert @hummingbird.distance(1)
  end

  def test_hummingbird_input_dial
    assert @hummingbird.dial(1)
  end

  def test_hummingbird_input_voltage
    assert @hummingbird.voltage(1)
  end
end
