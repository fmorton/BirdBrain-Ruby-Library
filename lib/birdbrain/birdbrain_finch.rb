#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainFinch < BirdbrainMicrobit
  VALID_LED_PORTS = '123'
  VALID_TRILED_PORTS = '12'
  VALID_SENSOR_PORTS = '123'
  VALID_SERVO_PORTS = '1234'

  def beak(r_intensity, g_intensity, b_intensity)
    BirdbrainHummingbirdOutput.tri_led(device, 1, r_intensity, g_intensity, b_intensity) if connected?
  end
end
