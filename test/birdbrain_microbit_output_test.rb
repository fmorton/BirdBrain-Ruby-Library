#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainMicrobitOutputTest < Minitest::Test
  def test_microbit_output_display
    hummingbird = BirdbrainHummingbird.new

    led_list_numeric = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1]
    led_list_boolean = [false, false, false, false, false, true, true, true, true, true, false, false, false, false, false, true,
                        true, true, true, true, false, false, false, false, false]

    4.times do
      assert hummingbird.microbit_display(led_list_numeric)
      sleep(0.5)
      assert hummingbird.microbit_display(led_list_boolean)
      sleep(0.5)
      assert hummingbird.microbit_clear_display
      sleep(0.5)
    end
  end

  def test_microbit_output_display_state
    hummingbird = BirdbrainHummingbird.new

    led_list_mixed = [1, 1, 1, 1, true, 1, 0, false, 0, 1, 1, 0, 0, 0, 1, 1, false, 0, 0, 1, 1, 1, 1, 1, true]

    assert hummingbird.microbit_display(led_list_mixed)

    assert hummingbird.state.microbit_display_map[0] == 1
    assert hummingbird.state.microbit_display_map[1] == 1
    assert hummingbird.state.microbit_display_map[2] == 1
    assert hummingbird.state.microbit_display_map[3] == 1
    assert hummingbird.state.microbit_display_map[4] == 1
    assert hummingbird.state.microbit_display_map[5] == 1
    assert hummingbird.state.microbit_display_map[6] == 0
    assert hummingbird.state.microbit_display_map[7] == 0
    assert hummingbird.state.microbit_display_map[8] == 0
    assert hummingbird.state.microbit_display_map[9] == 1
    assert hummingbird.state.microbit_display_map[10] == 1
    assert hummingbird.state.microbit_display_map[11] == 0
    assert hummingbird.state.microbit_display_map[12] == 0
    assert hummingbird.state.microbit_display_map[13] == 0
    assert hummingbird.state.microbit_display_map[14] == 1
    assert hummingbird.state.microbit_display_map[15] == 1
    assert hummingbird.state.microbit_display_map[16] == 0
    assert hummingbird.state.microbit_display_map[17] == 0
    assert hummingbird.state.microbit_display_map[18] == 0
    assert hummingbird.state.microbit_display_map[19] == 1
    assert hummingbird.state.microbit_display_map[20] == 1
    assert hummingbird.state.microbit_display_map[21] == 1
    assert hummingbird.state.microbit_display_map[22] == 1
    assert hummingbird.state.microbit_display_map[23] == 1
    assert hummingbird.state.microbit_display_map[24] == 1

    sleep(4)

    assert hummingbird.microbit_clear_display
  end

  def test_microbit_print
    hummingbird = BirdbrainHummingbird.new

    assert hummingbird.microbit_print('A TEST')
    sleep(4)
  end
end
