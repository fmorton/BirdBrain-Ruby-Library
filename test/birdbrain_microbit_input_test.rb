#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainMicrobitInputTest < BirdbrainHummingbirdTestSetup
  def test_microbit_input
    return unless @hummingbird_connected

    microbit_input_microbit_test
    microbit_input_accelerometer_test
    microbit_input_compass_test
    microbit_input_magnetometer_test
    microbit_input_button_test?
    microbit_input_shaking_test?
    microbit_input_orientation_test
  end

  def microbit_input_microbit_test
    assert_true_or_false @hummingbird.microbit?
  end

  def microbit_input_accelerometer_test
    assert_xyz_results(@hummingbird.microbit_accelerometer)
  end

  def microbit_input_compass_test
    assert (@hummingbird.microbit_compass >= 0) && (@hummingbird.microbit_compass <= 360)
  end

  def microbit_input_magnetometer_test
    assert_xyz_results(@hummingbird.microbit_magnetometer)
  end

  def microbit_input_button_test?
    assert_true_or_false(@hummingbird.microbit_button?('A'))
  end

  def microbit_input_shaking_test?
    assert_true_or_false(@hummingbird.microbit_shaking?)
  end

  def microbit_input_orientation_test
    assert BirdbrainMicrobitInput::MICROBIT_ORIENTATION_RESULTS.include?(@hummingbird.microbit_orientation)

    assert_true_or_false(@hummingbird.microbit_orientation_screen_up?)
    assert_true_or_false(@hummingbird.microbit_orientation_screen_down?)
    assert_true_or_false(@hummingbird.microbit_orientation_tilt_left?)
    assert_true_or_false(@hummingbird.microbit_orientation_tilt_right?)
    assert_true_or_false(@hummingbird.microbit_orientation_logo_up?)
    assert_true_or_false(@hummingbird.microbit_orientation_logo_down?)
  end
end
