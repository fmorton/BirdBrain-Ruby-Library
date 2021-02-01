#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainHummingbirdInputTest < BirdbrainFinchTestSetup
  def test_hummingbird_input?
    assert_true_or_false @finch.finch?
  end

  def test_hummingbird_input?
    assert !@finch.moving?
  end
end
