#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainTest < Minitest::Test
  def test_version_number_available
    refute_nil Birdbrain::VERSION
  end

  def test_connection
    birdbrain = BirdbrainConnection.new

    assert birdbrain.device == BirdbrainConnection::DEFAULT_DEVICE
    assert birdbrain.connected?

    assert true
  end

  def test_input_shaking
    birdbrain = BirdbrainConnection.new

    assert_equal(birdbrain.shaking?, false)
  end

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
end
