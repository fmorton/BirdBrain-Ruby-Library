#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainFinchInput < BirdbrainRequest
  DEFAULT_FACTOR = 1.0
  DEFAULT_MIN_RESPONSE = 0
  DEFAULT_MAX_RESPONSE = 100
  DEFAULT_TYPE_METHOD = 'to_i'
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
    distance_options = {}
    distance_options[:factor] = 0.0919
    distance_options[:min_response] = DEFAULT_UNLIMITED_MIN_RESPONSE
    distance_options[:max_response] = DEFAULT_UNLIMITED_MAX_RESPONSE

    sensor(device, 'Distance', 'static', distance_options)
  end

  def self.line(device, direction)
    calc_direction = 'Left' if direction == BirdbrainFinch::LEFT
    calc_direction = 'Right' if direction == BirdbrainFinch::RIGHT

    sensor(device, 'Line', calc_direction)
  end

  def self.encoder(device, direction)
    encoder_options = {}
    encoder_options[:min_response] = DEFAULT_UNLIMITED_MIN_RESPONSE
    encoder_options[:max_response] = DEFAULT_UNLIMITED_MAX_RESPONSE
    encoder_options[:type_method] = 'to_f'

    calc_direction = 'Left' if direction == BirdbrainFinch::LEFT
    calc_direction = 'Right' if direction == BirdbrainFinch::RIGHT

    sensor(device, 'Encoder', calc_direction, encoder_options)
  end

  def self.sensor(device, sensor, other = nil, options = {})
    factor = options.key?(:factor) ? options[:factor] : DEFAULT_FACTOR
    min_response = options.key?(:min_response) ? options[:min_response] : DEFAULT_MIN_RESPONSE
    max_response = options.key?(:max_response) ? options[:max_response] : DEFAULT_MAX_RESPONSE
    type_method = options.key?(:type_method) ? options[:type_method] : DEFAULT_TYPE_METHOD

    request = ['hummingbird', 'in', sensor]
    request << other unless other.nil?
    request << device

    response = response_body(request)

    (response.nil? ? nil : bounds((response.to_f * factor).send(type_method), min_response, max_response))
  end
end
