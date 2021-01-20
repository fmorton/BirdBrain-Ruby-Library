#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainOutputTest < Minitest::Test
  def test_output_led
    birdbrain = BirdbrainConnection.new

    assert birdbrain.led(1, 100)
    sleep(1)
    assert birdbrain.led(1, 0)
  end

  def test_output_tri_led
    birdbrain = BirdbrainConnection.new

    assert birdbrain.tri_led(1, 0, 50, 100)
    sleep(1)
    assert birdbrain.tri_led(1, 50, 100, 0)
    sleep(1)
    assert birdbrain.tri_led(1, 100, 0, 50)
    sleep(1)
    assert birdbrain.tri_led(1, 0, 0, 0)
  end

  def test_output_servo
    birdbrain = BirdbrainConnection.new

    assert birdbrain.servo(1, 0)
    sleep(1)
    assert birdbrain.servo(1, 180)
    sleep(1)
    assert birdbrain.servo(1, 90)
  end

  def test_output_rotation_servo
    birdbrain = BirdbrainConnection.new

    assert birdbrain.rotation_servo(3, 100)
    sleep(1)
    assert birdbrain.rotation_servo(3, 50)
    sleep(1)
    assert birdbrain.rotation_servo(3, -50)
    sleep(1)
    assert birdbrain.rotation_servo(3, -100)
    sleep(1)
    assert birdbrain.rotation_servo(3, 0)
    sleep(1)
  end

  def test_output_play_note
    birdbrain = BirdbrainConnection.new

    assert birdbrain.play_note(32, 4)
    sleep(5)
    assert birdbrain.play_note(65, 3)
    sleep(5)
    assert birdbrain.play_note(80, 2)
    sleep(5)
  end
end
