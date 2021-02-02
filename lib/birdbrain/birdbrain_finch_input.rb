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
  ORIENTATIONS = ['Beak%20Up', 'Beak%20Down', 'Tilt%20Left', 'Tilt%20Right', 'Level', 'Upside%20Down']
  ORIENTATION_RESULTS = ['Beak up', 'Beak down', 'Tilt left', 'Tilt right', 'Level', 'Upside down']
  ORIENTATION_IN_BETWEEN = 'In between'

  def self.finch?(device)
    request_status(response_body('hummingbird', 'in', 'isHummingbird', 'static', device))
  end

  def self.moving?(device)
    request_status(response_body('hummingbird', 'in', 'finchIsMoving', 'static', device))
  end

  def self.light(device, direction)
    sensor(device, 'Light', calculate_left_or_right(direction))
  end

  def self.distance(device)
    distance_options = {}
    distance_options[:factor] = 0.0919
    distance_options[:min_response] = DEFAULT_UNLIMITED_MIN_RESPONSE
    distance_options[:max_response] = DEFAULT_UNLIMITED_MAX_RESPONSE

    sensor(device, 'Distance', 'static', distance_options)
  end

  def self.line(device, direction)
    sensor(device, 'Line', calculate_left_or_right(direction))
  end

  def self.encoder(device, direction)
    encoder_options = {}
    encoder_options[:min_response] = DEFAULT_UNLIMITED_MIN_RESPONSE
    encoder_options[:max_response] = DEFAULT_UNLIMITED_MAX_RESPONSE
    encoder_options[:type_method] = 'to_f'

    sensor(device, 'Encoder', calculate_left_or_right(direction), encoder_options)
  end

  def self.accelerometer(device)
    xyz_response(device, 'finchAccel')
  end

  def self.compass(device)
    (response = response_body('hummingbird', 'in', 'finchCompass', 'static', device)).nil? ? response : response.to_i
  end

  def self.magnetometer(device)
    xyz_response(device, 'finchMag')
  end

  def self.orientation(device)
    ORIENTATIONS.each_with_index do |orientation, index|
      return nil if (response = response_body('hummingbird', 'in', 'finchOrientation', orientation, device)).nil?

      return ORIENTATION_RESULTS[index] if request_status(response)
    end

    ORIENTATION_IN_BETWEEN
  end

  def self.orientation_beak_up?(device)
    orientation_check(device, 0)
  end

  def self.orientation_beak_down?(device)
    orientation_check(device, 1)
  end

  def self.orientation_tilt_left?(device)
    orientation_check(device, 2)
  end

  def self.orientation_tilt_right?(device)
    orientation_check(device, 3)
  end

  def self.orientation_level?(device)
    orientation_check(device, 4)
  end

  def self.orientation_upside_down?(device)
    orientation_check(device, 5)
  end

  def self.orientation_check(device, index)
    request_status(response_body('hummingbird', 'in', 'finchOrientation', ORIENTATIONS[index], device))
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
