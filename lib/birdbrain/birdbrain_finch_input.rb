#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainFinchInput < BirdbrainRequest
  DEFAULT_FACTOR = 1.0
  DEFAULT_MIN_RESPONSE = 0
  DEFAULT_MAX_RESPONSE = 100
  DEFAULT_METHOD_TYPE = 'to_i'
  DEFAULT_UNLIMITED_MIN_RESPONSE = -1000000
  DEFAULT_UNLIMITED_MAX_RESPONSE = 1000000

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
    sensor(device, 'Distance', 'static', 0.0919, DEFAULT_UNLIMITED_MIN_RESPONSE, DEFAULT_UNLIMITED_MAX_RESPONSE)
  end

  def self.line(device, direction)
    calc_direction = 'Left' if direction == BirdbrainFinch::LEFT
    calc_direction = 'Right' if direction == BirdbrainFinch::RIGHT

    sensor(device, 'Line', calc_direction)
  end

  def self.encoder(device, direction)
    calc_direction = 'Left' if direction == BirdbrainFinch::LEFT
    calc_direction = 'Right' if direction == BirdbrainFinch::RIGHT

    sensor(device, 'Encoder', calc_direction, DEFAULT_FACTOR, DEFAULT_UNLIMITED_MIN_RESPONSE, DEFAULT_UNLIMITED_MAX_RESPONSE, 'to_f')
  end

  def self.sensor(device, sensor, other = nil, factor = DEFAULT_FACTOR, min_response = DEFAULT_MIN_RESPONSE, max_response = DEFAULT_MAX_RESPONSE, type_method = DEFAULT_METHOD_TYPE)
    request = [ 'hummingbird', 'in', sensor ]
    request << other unless other.nil?
    request << device

    response = response_body(request)

    puts "DEBUG: response ================================================================================ #{response.inspect}"
    (response.nil? ? nil : bounds((response.to_f * factor).send(type_method), min_response, max_response))
  end
end
