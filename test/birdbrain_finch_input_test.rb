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

  def test_finch_distance
    assert @finch.distance >= 0
  end

  def test_finch_line
    assert @finch.line(BirdbrainFinch::LEFT) >= 0
    assert @finch.line(BirdbrainFinch::LEFT) <= 100
    assert @finch.line(BirdbrainFinch::RIGHT) >= 0
    assert @finch.line(BirdbrainFinch::RIGHT) <= 100
  end

  def test_finch_encoder
    assert @finch.encoder(BirdbrainFinch::LEFT).is_a?(Float)
    assert @finch.encoder(BirdbrainFinch::RIGHT).is_a?(Float)

    assert @finch.motors(20, -20)
    sleep(2)
    assert @finch.encoder(BirdbrainFinch::LEFT).is_a?(Float)
    assert @finch.encoder(BirdbrainFinch::RIGHT).is_a?(Float)
    assert @finch.stop
  end

  def test_finch_accelerometer
    assert !@finch.microbit_accelerometer # turned off on microbit

    assert_xyz_results(@finch.accelerometer)
  end

  def test_finch_compass
    assert !@finch.microbit_compass # turned off on microbit

    assert (@finch.compass >= 0) && (@finch.compass <= 360)
  end
end
