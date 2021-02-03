#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_minitest'

class BirdbrainHummingbirdErrorTest < BirdbrainMinitest
  def test_error_invalid_port_number
    hummingbird = BirdbrainHummingbird.new

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
end
