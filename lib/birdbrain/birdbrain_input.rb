#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainInput < BirdbrainRequest
  def self.shaking?(device)
    return nil if not_connected?(device)

    response = response_body('hummingbird', 'in', 'orientation', 'Shake', device)

    request_status(response)
  end
end
