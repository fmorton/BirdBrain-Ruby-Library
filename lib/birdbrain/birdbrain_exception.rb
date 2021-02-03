#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainException < StandardError
  def self.disconnect(device, message)
    begin
      BirdbrainRequest.disconnect(device)
    rescue BirdbrainException
      true
    end

    raise(BirdbrainException, message)
  end
end
