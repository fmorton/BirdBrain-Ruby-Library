#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainErrorTest < Minitest::Test
  def error_exception
    yield

    assert false
  rescue BirdbrainException => e
    assert true, e.message
  end

  def test_error_missing_device
    error_exception { BirdbrainHummingbird.new(nil) }
  end

  def test_error_invalid_device
    error_exception { BirdbrainHummingbird.new('D') }
  end

  def test_error_invalid_port_number
    hummingbird = BirdbrainHummingbird.new

    error_exception { hummingbird.led(nil, 0) }
    error_exception { hummingbird.light(nil) }
    error_exception { hummingbird.servo(nil, 0) }
    error_exception { hummingbird.tri_led(nil, 0, 0, 0) }

    error_exception { hummingbird.led(0, 0) }
    error_exception { hummingbird.light(0) }
    error_exception { hummingbird.servo(0, 0) }
    error_exception { hummingbird.tri_led(0, 0, 0, 0) }

    error_exception { hummingbird.led(4, 0) }
    error_exception { hummingbird.light(4) }
    error_exception { hummingbird.servo(5, 0) }
    error_exception { hummingbird.tri_led(3, 0, 0, 0) }
  end
end
