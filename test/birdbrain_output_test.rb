#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainOutputTest < Minitest::Test
  def test_output_led
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.led(1, 100)
    sleep(1)
    assert hummingbird.led(1, 0)
  end

  def test_output_tri_led
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.tri_led(1, 0, 50, 100)
    sleep(1)
    assert hummingbird.tri_led(1, 50, 100, 0)
    sleep(1)
    assert hummingbird.tri_led(1, 100, 0, 50)
    sleep(1)
    assert hummingbird.tri_led(1, 0, 0, 0)
  end

  def test_output_servo
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.servo(1, 0)
    sleep(1)
    assert hummingbird.servo(1, 180)
    sleep(1)
    assert hummingbird.servo(1, 90)
  end

  def test_output_rotation_servo
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.rotation_servo(3, 100)
    sleep(1)
    assert hummingbird.rotation_servo(3, 50)
    sleep(1)
    assert hummingbird.rotation_servo(3, -50)
    sleep(1)
    assert hummingbird.rotation_servo(3, -100)
    sleep(1)
    assert hummingbird.rotation_servo(3, 0)
    sleep(1)
  end

  def test_output_play_note
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.play_note(32, 4)
    sleep(5)
    assert hummingbird.play_note(65, 3)
    sleep(5)
    assert hummingbird.play_note(80, 2)
    sleep(5)
  end
end
