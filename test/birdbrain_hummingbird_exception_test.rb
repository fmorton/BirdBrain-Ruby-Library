#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainHummingbirdExceptionTest < BirdbrainMinitest
  def test_hummingbird_excepton_missing_device
    assert_exception { BirdbrainHummingbird.connect(nil) }
  end

  def test_hummingbird_excepton_invalid_device
    assert_exception { BirdbrainHummingbird.connect('D') }
  end

  def test_hummingbird_excepton_no_connection
    assert !BirdbrainHummingbird.connect.connected?

    stub_for_nil_response do
      assert_exception { @hummingbird = BirdbrainHummingbird.connect('A', true) }
    end
  end
end
