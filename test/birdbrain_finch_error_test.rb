#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_minitest'

class BirdbrainFinchErrorTest < BirdbrainMinitest
  def test_error_missing_device
    assert_exception { BirdbrainFinch.new(nil) }
  end

  def test_error_invalid_device
    assert_exception { BirdbrainFinch.new('D') }
  end

  def test_error_invalid_port_number
    finch = BirdbrainFinch.new(BirdbrainTest::FINCH_TEST_DEVICE)

    assert_exception { finch.tail(nil, 0, 0, 0) }

    assert_exception { finch.tail(0, 0, 0, 0) }

    assert_exception { finch.tail(5, 0, 0, 0) }
  end
end
