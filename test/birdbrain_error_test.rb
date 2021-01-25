#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_minitest'

class BirdbrainErrorTest < BirdbrainMinitest
  def test_error_missing_device
    assert_exception { BirdbrainHummingbird.new(nil) }
  end

  def test_error_invalid_device
    assert_exception { BirdbrainHummingbird.new('D') }
  end

  def test_error_invalid_port_number
    hummingbird = BirdbrainHummingbird.new

    assert_exception { hummingbird.led(nil, 0) }
    assert_exception { hummingbird.light(nil) }
    assert_exception { hummingbird.position_servo(nil, 0) }
    assert_exception { hummingbird.tri_led(nil, 0, 0, 0) }

    assert_exception { hummingbird.led(0, 0) }
    assert_exception { hummingbird.light(0) }
    assert_exception { hummingbird.position_servo(0, 0) }
    assert_exception { hummingbird.tri_led(0, 0, 0, 0) }

    assert_exception { hummingbird.led(4, 0) }
    assert_exception { hummingbird.light(4) }
    assert_exception { hummingbird.position_servo(5, 0) }
    assert_exception { hummingbird.tri_led(3, 0, 0, 0) }
  end
end
