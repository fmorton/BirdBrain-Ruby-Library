#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_finch_test_setup'

class BirdbrainDeviceTest < BirdbrainMinitest
  def test_remap_device
    birdbrain_device = BirdbrainDevice.new

    assert birdbrain_device.device == 'A'
    assert birdbrain_device.remap_device == 'A'
    assert birdbrain_device.remap_device('A') == 'A'
  end

  # def test_remap_device_override
  # BirdbrainDevice.stub('remap_device', 'B') do
  # birdbrain_device = BirdbrainDevice.new
  # assert birdbrain_device.device == 'B'
  # assert birdbrain_device.remap_device == 'B'
  # assert birdbrain_device.remap_device('A') == 'B'
  # end
  # end
end
