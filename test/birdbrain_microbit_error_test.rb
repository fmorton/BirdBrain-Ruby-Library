#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainMicrobitErrorTest < BirdbrainHummingbirdTestSetup
  def test_hummingbird_excepton_lost_connection_for_microbit
    return unless @hummingbird_connected

    stub_for_nil_response do
      assert_nil @hummingbird.microbit?
      assert_nil @hummingbird.microbit_accelerometer
      assert_nil @hummingbird.microbit_compass
      assert_nil @hummingbird.microbit_magnetometer
      assert_nil @hummingbird.microbit_button?('A')
      assert_nil @hummingbird.microbit_shaking?
      assert_nil @hummingbird.microbit_orientation
      assert_nil @hummingbird.microbit_orientation_screen_up?
      assert_nil @hummingbird.microbit_orientation_screen_down?
      assert_nil @hummingbird.microbit_orientation_tilt_left?
      assert_nil @hummingbird.microbit_orientation_tilt_right?
      assert_nil @hummingbird.microbit_orientation_logo_up?
      assert_nil @hummingbird.microbit_orientation_logo_down?
      assert_nil @hummingbird.microbit_display([])
      assert_nil @hummingbird.microbit_clear_display
      assert_nil @hummingbird.microbit_point(1, 1, 1)
      assert_nil @hummingbird.microbit_print('Test')
    end
  end
end
