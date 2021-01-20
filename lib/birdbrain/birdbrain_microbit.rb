#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainInput < BirdbrainRequest
  def self.microbit?(device)
    request_status(response_body('hummingbird', 'in', 'isHummingbird', 'static', device))
  end

  def self.shaking?(device)
    request_status(response_body('hummingbird', 'in', 'orientation', 'Shake', device))
  end
end
