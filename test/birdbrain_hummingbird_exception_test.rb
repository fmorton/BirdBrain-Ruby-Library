#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainHummingbirdExceptionTest < BirdbrainMinitest
  def test_hummingbird_excepton_no_connection
    stub_for_nil_response do
      assert_exception { @hummingbird = BirdbrainHummingbird.new(BirdbrainTest::HUMMINGBIRD_TEST_DEVICE) }
    end
  end

  def test_hummingbird_excepton_lost_connection_for_microbit
    @hummingbird = BirdbrainHummingbird.new(BirdbrainTest::HUMMINGBIRD_TEST_DEVICE)

    assert @hummingbird.connected?

    stub_for_nil_response do
      assert_nil @hummingbird.microbit?
      assert_nil @hummingbird.microbit_accelerometer
      assert_nil @hummingbird.microbit_compass
      assert_nil @hummingbird.microbit_magnetometer
      assert_nil @hummingbird.microbit_button?('A')
      assert_nil @hummingbird.microbit_shaking?
      assert_nil @hummingbird.microbit_orientation
      assert_nil @hummingbird.orientation_screen_up?
      assert_nil @hummingbird.orientation_screen_down?
      assert_nil @hummingbird.orientation_tilt_left?
      assert_nil @hummingbird.orientation_tilt_right?
      assert_nil @hummingbird.orientation_logo_up?
      assert_nil @hummingbird.orientation_logo_down?
      assert_nil @hummingbird.microbit_display([])
      assert_nil @hummingbird.microbit_clear_display
      assert_nil @hummingbird.microbit_point(1, 1, 1)
      assert_nil @hummingbird.microbit_print('Test')
    end
  end

  def test_hummingbird_excepton_lost_connection_for_hummingbird
    @hummingbird = BirdbrainHummingbird.new

    assert @hummingbird.connected?

    stub_for_nil_response do
      assert_nil @hummingbird.hummingbird?
      assert_nil @hummingbird.light(1)
      assert_nil @hummingbird.sound(1)
      assert_nil @hummingbird.distance(1)
      assert_nil @hummingbird.dial(1)
      assert_nil @hummingbird.voltage(1)
      assert_nil @hummingbird.position_servo(1, 0)
      assert_nil @hummingbird.rotation_servo(1, 0)
      assert_nil @hummingbird.led(1, 0)
      assert_nil @hummingbird.tri_led(1, 0, 0, 0)
      assert_nil @hummingbird.play_note(80, 1)
    end
  end
end
