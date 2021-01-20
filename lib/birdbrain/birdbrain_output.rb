#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainOutput < BirdbrainRequest
  def self.led(device, port, intensity)
    request_status(response_body('hummingbird', 'out', 'led', port.to_s, bounds(calculate_intensity(intensity), 0, 255), device))
  end

  def self.tri_led(device, port, r_intensity, g_intensity, b_intensity)
    calculated_r = bounds(calculate_intensity(r_intensity), 0, 255)
    calculated_g = bounds(calculate_intensity(g_intensity), 0, 255)
    calculated_b = bounds(calculate_intensity(b_intensity), 0, 255)

    request_status(response_body('hummingbird', 'out', 'triled', port.to_s, calculated_r, calculated_g, calculated_b, device))
  end

  def self.servo(device, port, angle)
    request_status(response_body('hummingbird', 'out', 'servo', port.to_s, bounds(calculate_angle(angle), 0, 254), device))
  end
end
