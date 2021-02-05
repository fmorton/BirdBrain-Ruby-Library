#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainFinchExceptionTest < BirdbrainFinchTestSetup
  def test_finch_exception_missing_device
    assert_exception { !BirdbrainFinch.connect(nil) }
  end

  def test_finch_exception_invalid_device
    assert_exception { !BirdbrainFinch.connect('D') }
  end

  def test_finch_exception_no_connection
    stub_for_nil_response do
      assert_exception { BirdbrainFinch.connect('A', true) }
    end
  end
end
