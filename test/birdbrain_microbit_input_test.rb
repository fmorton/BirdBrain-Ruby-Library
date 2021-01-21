#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test_setup'

class BirdbrainMicrobitInputTest < BirdbrainTestSetup
  def test_input_microbit
    assert @hummingbird.microbit?
  end

  def test_input_microbit_accelerometer
    xyz = @hummingbird.microbit_accelerometer

    assert_xyz_results(xyz)
  end

  def test_input_microbit_shaking
    assert_equal(@hummingbird.shaking?, false)
  end

  def assert_xyz_results(xyz)
    assert xyz.is_a?(Array)
    assert xyz.size == 3
    assert xyz[0].is_a?(Float)
    assert xyz[1].is_a?(Float)
    assert xyz[2].is_a?(Float)
  end
end
