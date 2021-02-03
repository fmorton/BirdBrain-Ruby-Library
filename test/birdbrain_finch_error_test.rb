#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainFinchErrorTest < BirdbrainMinitest
  def test_error_invalid_parameter
    finch = BirdbrainFinch.new(BirdbrainTest::FINCH_TEST_DEVICE)

    assert !finch.tail(nil, 0, 0, 0)
    assert !finch.tail(0, 0, 0, 0)
    assert !finch.tail(5, 0, 0, 0)
    assert !finch.light('UNKNOWN')
    assert !finch.line('UNKNOWN')
    assert !finch.encoder('UNKNOWN')
    assert !finch.move('UNKNOWN', 1, 1)
    assert !finch.turn('UNKNOWN', 1, 1)
  end
end
