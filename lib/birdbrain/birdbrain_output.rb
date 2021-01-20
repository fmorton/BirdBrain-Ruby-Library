#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainOutput < BirdbrainRequest
  def self.led(device, port, intensity)
    return nil if not_connected?(device)

    response = response_body('hummingbird', 'out', 'led', port.to_s, bounds(calculate_intensity(intensity), 0, 100), device)

    request_status(response)
  end
end
