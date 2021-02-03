#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainMicrobitInputTest < BirdbrainHummingbirdTestSetup
  def test_microbit_input?
    assert_true_or_false @hummingbird.microbit?
  end

  def test_microbit_input_accelerometer
    assert_xyz_results(@hummingbird.microbit_accelerometer)
  end

  def test_microbit_input_compass
    assert (@hummingbird.microbit_compass >= 0) && (@hummingbird.microbit_compass <= 360)
  end

  def test_microbit_input_magnetometer
    assert_xyz_results(@hummingbird.microbit_magnetometer)
  end

  def test_microbit_input_button?
    assert_true_or_false(@hummingbird.microbit_button?('A'))
  end

  def test_microbit_input_shaking?
    assert_true_or_false(@hummingbird.microbit_shaking?)
  end

  def test_microbit_input_orientation
    assert BirdbrainMicrobitInput::MICROBIT_ORIENTATION_RESULTS.include?(@hummingbird.microbit_orientation)

    assert_true_or_false(@hummingbird.microbit_orientation_screen_up?)
    assert_true_or_false(@hummingbird.microbit_orientation_screen_down?)
    assert_true_or_false(@hummingbird.microbit_orientation_tilt_left?)
    assert_true_or_false(@hummingbird.microbit_orientation_tilt_right?)
    assert_true_or_false(@hummingbird.microbit_orientation_logo_up?)
    assert_true_or_false(@hummingbird.microbit_orientation_logo_down?)
  end
end
