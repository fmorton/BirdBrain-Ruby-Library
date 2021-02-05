#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainHummingbirdInputTest < BirdbrainHummingbirdTestSetup
  def test_hummingbird_input
    return unless @hummingbird_connected

    hummingbird_hummingbird_test
    hummingbird_input_light_test
    hummingbird_input_sound_test
    hummingbird_input_distance_test
    hummingbird_input_dial_test
    hummingbird_input_voltage_test
  end

  def hummingbird_hummingbird_test
    assert_true_or_false @hummingbird.hummingbird?
  end

  def hummingbird_input_light_test
    assert @hummingbird.light(1)
  end

  def hummingbird_input_sound_test
    assert @hummingbird.sound(1)
  end

  def hummingbird_input_distance_test
    assert @hummingbird.distance(1)
  end

  def hummingbird_input_dial_test
    assert @hummingbird.dial(1)
  end

  def hummingbird_input_voltage_test
    assert @hummingbird.voltage(1)
  end
end
