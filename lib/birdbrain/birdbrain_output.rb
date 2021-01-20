#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainOutput < BirdbrainRequest
  def self.led(device, port, intensity)
    request_status(response_body('hummingbird', 'out', 'led', port.to_s, bounds(calculate_intensity(intensity), 0, 255), device))
  end
end
