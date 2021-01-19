#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'net/http'

class BirdbrainRequest
  def self.uri(*args)
    uri = 'http://127.0.0.1:30061'
    args.flatten.each { |s| uri += "/#{s}" }
    uri
  end

  def self.response(*args)
    Net::HTTP.get_response(URI.parse(uri(args)))
  rescue Errno::ECONNREFUSED
    nil
  end

  def self.response_body(*args)
    response = response(args)

    return nil if response.nil?
    return nil if response.body.downcase == 'not connected'

    response.body
  end

  def self.connected?(device)
    response = response_body('hummingbird', 'in', 'orientation', 'Shake', device)

    !response.nil?
  end
  # DEBUG
  # http://127.0.0.1:30061/hummingbird/in/orientation/Shake/A
  # http://127.0.0.1:30061/hummingbird/in/isHummingbird/static/A
  # SET LED!!!!!!!!!
  # http://127.0.0.1:30061/hummingbird/out/led/1/255/A
  # SET LED!!!!!!!!!
  # http://127.0.0.1:30061/hummingbird/out/led/1/0/A
end
