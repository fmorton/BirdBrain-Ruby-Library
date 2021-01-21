#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainMicrobitOutputTest < Minitest::Test
  def test_microbit_output_display
    birdbrain = BirdbrainConnection.new

    led_list_numeric = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1]
    led_list_boolean = [false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true,
                        true, true, true, true, false, false, false, false, false]

    4.times do
      assert birdbrain.microbit_display(led_list_numeric)
      sleep(0.5)
      assert birdbrain.microbit_display(led_list_boolean)
      sleep(0.5)
      assert birdbrain.microbit_clear_display
      sleep(0.5)
    end
  end

  def test_microbit_print
    birdbrain = BirdbrainConnection.new

    assert birdbrain.microbit_print('A TEST')
    sleep(4)
  end
end
