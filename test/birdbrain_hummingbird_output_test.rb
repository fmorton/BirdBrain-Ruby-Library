#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_hummingbird_test_setup'

class BirdbrainHummingbirdOutputTest < BirdbrainHummingbirdTestSetup
  def test_hummingbird_output_led
    assert @hummingbird.led(1, 100)
    sleep(1)
    assert @hummingbird.led(1, 0)
  end

  def test_hummingbird_output_tri_led
    assert @hummingbird.tri_led(1, 0, 50, 100)
    sleep(1)
    assert @hummingbird.tri_led(1, 50, 100, 0)
    sleep(1)
    assert @hummingbird.tri_led(1, 100, 0, 50)
    sleep(1)
    assert @hummingbird.tri_led(1, 0, 0, 0)
  end

  def test_hummingbird_output_servo
    assert @hummingbird.position_servo(1, 0)
    sleep(1)
    assert @hummingbird.position_servo(1, 180)
    sleep(1)
    assert @hummingbird.position_servo(1, 90)
  end

  def test_hummingbird_output_rotation_servo
    assert @hummingbird.rotation_servo(3, 100)
    sleep(1)
    assert @hummingbird.rotation_servo(3, 50)
    sleep(1)
    assert @hummingbird.rotation_servo(3, -50)
    sleep(1)
    assert @hummingbird.rotation_servo(3, -100)
    sleep(1)
    assert @hummingbird.rotation_servo(3, 0)
    sleep(1)
  end

  def test_hummingbird_output_play_note
    assert @hummingbird.play_note(32, 4)
    sleep(5)
    assert @hummingbird.play_note(65, 3)
    sleep(5)
    assert @hummingbird.play_note(80, 2)
    sleep(5)
  end
end
