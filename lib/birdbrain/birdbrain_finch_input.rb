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

  def self.light(device, direction)
    calc_direction = 'Left' if direction == BirdbrainFinch::LEFT
    calc_direction = 'Right' if direction == BirdbrainFinch::RIGHT

    sensor(device, 'Light', calc_direction)
  end

  def self.distance(device)
    sensor(device, 'Distance', 'static', 0.0919, 1000000)
  end

  def self.line(device, direction)
    calc_direction = 'Left' if direction == BirdbrainFinch::LEFT
    calc_direction = 'Right' if direction == BirdbrainFinch::RIGHT

    sensor(device, 'Line', calc_direction)
  end

  def self.sensor(device, sensor, other = nil, factor = 1.0, max_response = 100, type_method = 'to_i')
    request = [ 'hummingbird', 'in', sensor ]
    request << other unless other.nil?
    request << device
    puts "DEBUG: request is #{request.inspect}"

    response = response_body(request)

    puts "DEBUG: response ================================================================================ #{response.inspect}"
    (response.nil? ? nil : bounds((response.to_f * factor).send(type_method), 0, max_response))
  end
end
