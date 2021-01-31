#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainFinchOutputTest < BirdbrainFinchTestSetup
  def test_finch_output_beak
    assert @finch.beak(0, 60, 70)
    sleep(1)
    assert @finch.beak(0, 0, 0)
    sleep(1)
  end

  def test_finch_output_tail
    assert @finch.tail(1, 0, 60, 70)
    sleep(1)
    assert @finch.tail(2, 100, 40, 0)
    sleep(1)
    assert @finch.tail(3, 0, 20, 120)
    sleep(1)
    assert @finch.tail(4, 100, 70, 120)
    sleep(1)
    assert @finch.tail(1, 0, 0, 0)
    assert @finch.tail(2, 0, 0, 0)
    assert @finch.tail(3, 0, 0, 0)
    assert @finch.tail(4, 0, 0, 0)
    sleep(1)
    assert @finch.tail('all', 0, 100, 20)
    sleep(1)
    assert @finch.tail('all', 0, 0, 0)
    sleep(1)
  end
end
