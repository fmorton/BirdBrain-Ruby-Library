#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainMicrobitOutput < BirdbrainRequest
  def self.microbit_display(state, device, led_list)
    state.microbit_display_map = led_list.collect { |pixel| (((pixel == 1) || pixel.is_a?(TrueClass)) ? 1 : 0) }
    # state.microbit_display_map = led_list.collect { |pixel| (((pixel == 1) || pixel.is_a?(TrueClass)) ? 'true' : 'false') }

    request_status(response_body('hummingbird', 'out', 'symbol', device, state.microbit_display_map_as_strings))
  end

  def self.microbit_clear_display(state, device)
    microbit_display(state, device, BirdbrainState.microbit_empty_display_map)
  end

  def self.microbit_print(device, message)
    calculated_message = message.gsub(' ', '%20')

    request_status(response_body('hummingbird', 'out', 'print', calculated_message, device))
  end
end
