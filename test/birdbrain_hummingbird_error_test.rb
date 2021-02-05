#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainHummingbirdErrorTest < BirdbrainHummingbirdTestSetup
  def test_hummingbird_error_invalid_parameter
    hummingbird = BirdbrainHummingbird.new

    assert_nil hummingbird.led(nil, 0)
    assert_nil hummingbird.light(nil)
    assert_nil hummingbird.position_servo(nil, 0)
    assert_nil hummingbird.tri_led(nil, 0, 0, 0)
    assert_nil hummingbird.led(0, 0)
    assert_nil hummingbird.light(0)
    assert_nil hummingbird.position_servo(0, 0)
    assert_nil hummingbird.tri_led(0, 0, 0, 0)
    assert_nil hummingbird.led(4, 0)
    assert_nil hummingbird.light(4)
    assert_nil hummingbird.position_servo(5, 0)
    assert_nil hummingbird.tri_led(3, 0, 0, 0)

    assert !hummingbird.led(nil, 0)
    assert !hummingbird.light(nil)
    assert !hummingbird.position_servo(nil, 0)
    assert !hummingbird.tri_led(nil, 0, 0, 0)
    assert !hummingbird.led(0, 0)
    assert !hummingbird.light(0)
    assert !hummingbird.position_servo(0, 0)
    assert !hummingbird.tri_led(0, 0, 0, 0)
    assert !hummingbird.led(4, 0)
    assert !hummingbird.light(4)
    assert !hummingbird.position_servo(5, 0)
    assert !hummingbird.tri_led(3, 0, 0, 0)
  end

  def test_hummingbird_error_connection
    assert BirdbrainHummingbird.find_device.connected? == @hummingbird_connected
  end

  def test_hummingbird_error_lost_connection_for_hummingbird
    return unless @hummingbird_connected

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
