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
end
