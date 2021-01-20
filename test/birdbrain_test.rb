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

  def test_output_led
    birdbrain = BirdbrainConnection.new

    assert birdbrain.led(1, 50)
    sleep(1)
    assert birdbrain.led(1, 0)
  end
end
