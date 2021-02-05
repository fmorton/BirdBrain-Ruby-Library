#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainFinchErrorTest < BirdbrainFinchTestSetup
  def test_finch_error_invalid_parameter
    finch = BirdbrainFinch.new

    assert_nil finch.tail(nil, 0, 0, 0)
    assert_nil finch.tail(0, 0, 0, 0)
    assert_nil finch.tail(5, 0, 0, 0)
    assert_nil finch.light('UNKNOWN')
    assert_nil finch.line('UNKNOWN')
    assert_nil finch.encoder('UNKNOWN')
    assert_nil finch.move('UNKNOWN', 1, 1)
    assert_nil finch.turn('UNKNOWN', 1, 1)

    assert !finch.tail(nil, 0, 0, 0)
    assert !finch.tail(0, 0, 0, 0)
    assert !finch.tail(5, 0, 0, 0)
    assert !finch.light('UNKNOWN')
    assert !finch.line('UNKNOWN')
    assert !finch.encoder('UNKNOWN')
    assert !finch.move('UNKNOWN', 1, 1)
    assert !finch.turn('UNKNOWN', 1, 1)
  end

  def test_finch_error_connection
    assert BirdbrainFinch.find_device.connected? == @finch_connected
  end

  def test_finch_excepton_lost_connection
    return unless @finch_connected

    assert @finch.connected?

    stub_for_nil_response do
      assert_nil @finch.moving?
      assert_nil @finch.light(BirdbrainFinch::LEFT)
      assert_nil @finch.distance
      assert_nil @finch.line(BirdbrainFinch::LEFT)
      assert_nil @finch.encoder(BirdbrainFinch::LEFT)
      assert_nil @finch.accelerometer
      assert_nil @finch.compass
      assert_nil @finch.magnetometer
      assert_nil @finch.orientation
      assert_nil @finch.orientation_beak_up?
      assert_nil @finch.orientation_beak_down?
      assert_nil @finch.orientation_tilt_left?
      assert_nil @finch.orientation_tilt_right?
      assert_nil @finch.orientation_level?
      assert_nil @finch.orientation_upside_down?
      assert_nil @finch.beak(0, 0, 0)
      assert_nil @finch.tail(1, 0, 0, 0)
      assert_nil @finch.play_note(80, 2)
      assert_nil @finch.move(BirdbrainFinch::FORWARD, 1, 1)
      assert_nil @finch.turn(BirdbrainFinch::LEFT, 1, 1)
      assert_nil @finch.motors(0, 0)
      assert_nil @finch.stop
      assert_nil @finch.reset_encoders

      assert @finch.wait_until_movement
      assert @finch.wait
      assert @finch.wait_until_movement_and_wait
    end
  end
end
