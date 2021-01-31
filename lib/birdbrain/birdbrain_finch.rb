#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainFinch < BirdbrainMicrobit
  VALID_LED_PORTS = '123'
  VALID_TRILED_PORTS = '1234'
  VALID_SENSOR_PORTS = '123'
  VALID_SERVO_PORTS = '1234'

  def beak(r_intensity, g_intensity, b_intensity)
    BirdbrainHummingbirdOutput.tri_led(device, 1, r_intensity, g_intensity, b_intensity) if connected?
  end

  def tail(port, r_intensity, g_intensity, b_intensity)
    if connected?
      if port.to_s == 'all'
        (2..4).each { |i| BirdbrainHummingbirdOutput.tri_led(device, port, r_intensity, g_intensity, b_intensity) }
      else
        BirdbrainHummingbirdOutput.tri_led(device, port + 1, r_intensity, g_intensity, b_intensity)if connected_and_valid?(port, VALID_TRILED_PORTS)
      end
    end
  end

  # DEBUG: same code as hummingbird
  def play_note(note, beats)
    BirdbrainHummingbirdOutput.play_note(device, note, beats) if connected?
  end
end
