#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainFinchExceptionTest < BirdbrainMinitest
  def test_finch_exception_no_connection
    stub_for_nil_response do
      assert_exception { @finch = BirdbrainFinch.new(BirdbrainTest::FINCH_TEST_DEVICE) }
    end
  end

  def test_finch_excepton_lost_connection
    @finch = BirdbrainFinch.new(BirdbrainTest::FINCH_TEST_DEVICE)

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

  def test_error_invalid_parameter
    finch = BirdbrainFinch.new(BirdbrainTest::FINCH_TEST_DEVICE)

    assert_exception { finch.tail(nil, 0, 0, 0) }
    assert_exception { finch.tail(0, 0, 0, 0) }
    assert_exception { finch.tail(5, 0, 0, 0) }
    assert_exception { finch.light('UNKNOWN') }
    assert_exception { finch.line('UNKNOWN') }
    assert_exception { finch.encoder('UNKNOWN') }
    assert_exception { finch.move('UNKNOWN', 1, 1) }
    assert_exception { finch.turn('UNKNOWN', 1, 1) }
  end
end
