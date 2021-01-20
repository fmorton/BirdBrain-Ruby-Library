#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainMicrobitOutput < BirdbrainRequest
  def self.microbit_display(device, led_list)
    calculated_led_list = led_list.collect { |pixel| (((pixel == 1) || pixel.is_a?(TrueClass)) ? 'true' : 'false') }

    request_status(response_body('hummingbird', 'out', 'symbol', device, calculated_led_list))
  end

  def self.microbit_clear_display(device)
    microbit_display(device, [false] * 25)
  end
end
