#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainFinchInputTest < BirdbrainFinchTestSetup
  def test_finch_input
    return unless @finch_connected

    finch_input_finch_test
    finch_input_moving_test?
    finch_input_light_test
    finch_input_distance_test
    finch_input_line_test
    finch_input_encoder_test
    finch_input_accelerometer_test
    finch_input_compass_test
    finch_input_magnetometer_test
    finch_input_orientation_test
  end

  def finch_input_finch_test
    assert_true_or_false @finch.finch?
  end

  def finch_input_moving_test?
    assert !@finch.moving?
  end

  def finch_input_light_test
    assert @finch.light(BirdbrainFinch::LEFT) >= 0
    assert @finch.light(BirdbrainFinch::LEFT) <= 100
    assert @finch.light(BirdbrainFinch::RIGHT) >= 0
    assert @finch.light(BirdbrainFinch::RIGHT) <= 100
  end

  def finch_input_distance_test
    assert @finch.distance >= 0
  end

  def finch_input_line_test
    assert @finch.line(BirdbrainFinch::LEFT) >= 0
    assert @finch.line(BirdbrainFinch::LEFT) <= 100
    assert @finch.line(BirdbrainFinch::RIGHT) >= 0
    assert @finch.line(BirdbrainFinch::RIGHT) <= 100
  end

  def finch_input_encoder_test
    assert @finch.encoder(BirdbrainFinch::LEFT).is_a?(Float)
    assert @finch.encoder(BirdbrainFinch::RIGHT).is_a?(Float)

    assert @finch.motors(20, -20)
    sleep(2)
    assert @finch.encoder(BirdbrainFinch::LEFT).is_a?(Float)
    assert @finch.encoder(BirdbrainFinch::RIGHT).is_a?(Float)
    assert @finch.stop
  end

  def finch_input_accelerometer_test
    assert !@finch.microbit_accelerometer # turned off on microbit

    assert_xyz_results(@finch.accelerometer)
  end

  def finch_input_compass_test
    assert !@finch.microbit_compass # turned off on microbit

    assert (@finch.compass >= 0) && (@finch.compass <= 360)
  end

  def finch_input_magnetometer_test
    assert !@finch.microbit_magnetometer # turned off on microbit

    assert_xyz_results(@finch.magnetometer)
  end

  def finch_input_orientation_test
    assert BirdbrainFinchInput::ORIENTATION_RESULTS.include?(@finch.orientation)

    assert_true_or_false(@finch.orientation_beak_up?)
    assert_true_or_false(@finch.orientation_beak_down?)
    assert_true_or_false(@finch.orientation_tilt_left?)
    assert_true_or_false(@finch.orientation_tilt_right?)
    assert_true_or_false(@finch.orientation_level?)
    assert_true_or_false(@finch.orientation_upside_down?)
  end
end
