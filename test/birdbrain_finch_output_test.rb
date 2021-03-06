#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainFinchOutputTest < BirdbrainFinchTestSetup
  def test_finch_input
    return unless @finch_connected

    finch_output_beak_test
    finch_output_tail_test
    finch_output_play_note_test
    finch_output_move_test
    finch_output_turn_test
    finch_output_motors_test
    finch_output_reset_encoders_test
  end

  def finch_output_beak_test
    assert @finch.beak(0, 60, 70)
    sleep(1)
    assert @finch.beak(0, 0, 0)
    sleep(1)
  end

  def finch_output_tail_test
    assert @finch.tail(1, 0, 60, 70)
    sleep(0.5)
    assert @finch.tail(2, 100, 40, 0)
    sleep(0.5)
    assert @finch.tail(3, 0, 20, 120)
    sleep(0.5)
    assert @finch.tail(4, 100, 70, 120)
    sleep(0.5)
    assert @finch.tail(1, 0, 0, 0)
    sleep(0.25)
    assert @finch.tail(2, 0, 0, 0)
    sleep(0.25)
    assert @finch.tail(3, 0, 0, 0)
    sleep(0.25)
    assert @finch.tail(4, 0, 0, 0)
    sleep(0.5)
    assert @finch.tail('all', 0, 100, 20)
    sleep(1)
    assert @finch.tail('all', 100, 0, 20)
    sleep(1)
    assert @finch.tail('all', 0, 0, 0)
    sleep(0.5)
  end

  def finch_output_play_note_test
    assert @finch.play_note(32, 4)
    sleep(5)
    assert @finch.play_note(65, 3)
    sleep(5)
    assert @finch.play_note(80, 2)
    sleep(5)
  end

  def finch_output_move_test
    assert @finch.move(BirdbrainFinch::FORWARD, 10, 50)
    sleep(1)
    assert @finch.move(BirdbrainFinch::BACKWARD, 10, 50)
    sleep(1)

    assert @finch.move(BirdbrainFinch::FORWARD, 1, 50)
    sleep(1)
    assert @finch.move(BirdbrainFinch::BACKWARD, 1, 50)
    sleep(1)

    assert @finch.move(BirdbrainFinch::FORWARD, 0.25, 50)
    sleep(1)
    assert @finch.move(BirdbrainFinch::BACKWARD, 0.25, 50)
    sleep(1)

    assert @finch.move(BirdbrainFinch::FORWARD, 10, 50, false)
    assert @finch.wait_until_movement
    assert @finch.moving?
    sleep(3)
    assert !@finch.moving?
    assert @finch.move(BirdbrainFinch::BACKWARD, 10, 50, false)
    sleep(3)
  end

  def finch_output_turn_test
    assert @finch.turn(BirdbrainFinch::LEFT, 180, 50)
    sleep(1)
    assert @finch.turn(BirdbrainFinch::RIGHT, 180, 50)
    sleep(1)

    assert @finch.turn(BirdbrainFinch::LEFT, 180, 50, false)
    assert @finch.wait_until_movement
    assert @finch.moving?
    sleep(3)
    assert !@finch.moving?
    assert @finch.turn(BirdbrainFinch::LEFT, 180, 50, false)
    sleep(3)
  end

  def finch_output_motors_test
    assert @finch.motors(10, -10)
    sleep(5)
    assert @finch.stop
  end

  def finch_output_reset_encoders_test
    assert @finch.reset_encoders
  end
end
