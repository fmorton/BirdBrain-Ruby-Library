#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test_setup'

class BirdbrainMicrobitInputTest < BirdbrainTestSetup
  def test_input_microbit
    assert @hummingbird.microbit?
  end

  def test_input_microbit_accelerometer
    assert_xyz_results(@hummingbird.microbit_accelerometer)
  end

  def test_input_microbit_compass
    assert (@hummingbird.microbit_compass >= 0) && (@hummingbird.microbit_compass <= 359)
  end

  def test_input_microbit_magnetometer
    assert_xyz_results(@hummingbird.microbit_magnetometer)
  end

  def test_input_microbit_shaking
    assert_equal(@hummingbird.microbit_shaking?, false)
  end

  def assert_xyz_results(xyz)
    assert xyz.is_a?(Array)
    assert xyz.size == 3
    assert xyz[0].is_a?(Float)
    assert xyz[1].is_a?(Float)
    assert xyz[2].is_a?(Float)
  end
end
