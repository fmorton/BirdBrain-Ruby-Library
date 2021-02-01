#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainFinchInput < BirdbrainRequest
  def self.finch?(device)
    request_status(response_body('hummingbird', 'in', 'isHummingbird', 'static', device))
  end

  def self.moving?(device)
    request_status(response_body('hummingbird', 'in', 'finchIsMoving', 'static', device))
  end
end
