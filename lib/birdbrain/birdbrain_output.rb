#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainOutput < BirdbrainRequest
  def self.led(device, port, intensity)
    request_status(response_body('hummingbird', 'out', 'led', port.to_s, bounds(calculate_intensity(intensity), 0, 255), device))
  end

  def self.servo(device, port, angle)
    request_status(response_body('hummingbird', 'out', 'servo', port.to_s, bounds(calculate_angle(angle), 0, 254), device))
  end
end
