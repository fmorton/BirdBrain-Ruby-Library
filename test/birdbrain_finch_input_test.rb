#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainFinchInputTest < BirdbrainFinchTestSetup
  def test_finch_input?
    assert_true_or_false @finch.finch?
  end

  def test_finch_input_moving?
    assert !@finch.moving?
  end

  def test_finch_light
    assert @finch.light(BirdbrainFinch::LEFT) >= 0
    assert @finch.light(BirdbrainFinch::LEFT) <= 100
    assert @finch.light(BirdbrainFinch::RIGHT) >= 0
    assert @finch.light(BirdbrainFinch::RIGHT) <= 100
  end
end
