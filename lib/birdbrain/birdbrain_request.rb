#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'net/http'

class BirdbrainRequest
  BIRDBRAIN_TEST = false

  def self.uri(*args)
    uri = 'http://127.0.0.1:30061'
    args.flatten.each { |s| uri += "/#{s}" }

    puts "Test: uri is #{uri}" if BIRDBRAIN_TEST

    uri
  end

  def self.response(*args)
    return false if (valid_args = args.flatten).include?(false)

    response = Net::HTTP.get_response(URI.parse(uri(valid_args)))

    sleep(0.01) # HACK: prevent http requests from overloading the bluebird connector

    response
  rescue Errno::ECONNREFUSED
    nil
  end

  def self.response_body(*args)
    response = response(args)

    return false if response == false

    return nil if response.nil?
    return nil if response.body.downcase == 'not connected'

    puts "Test: response: #{response.body.inspect}" if BIRDBRAIN_TEST

    response.body
  end

  def self.connected?(device)
    response = response_body('hummingbird', 'in', 'orientation', 'Shake', device)

    !response.nil?
  end

  def self.not_connected?(device)
    !connected?(device)
  end

  def self.disconnect(device)
    request_status(response_body('hummingbird', 'out', 'stopall', device))
  end

  def self.request_status(status)
    puts "Test: request status is #{status.inspect}" if BIRDBRAIN_TEST

    return nil if status.nil?

    return true if status == 'true'
    return true if status == 'led set'
    return true if status == 'triled set'
    return true if status == 'servo set'
    return true if status == 'buzzer set'
    return true if status == 'symbol set'
    return true if status == 'print set'
    return true if status == 'all stopped'

    return true if status == 'finch moved'
    return true if status == 'finch turned'
    return true if status == 'finch wheels started'
    return true if status == 'finch wheels stopped'
    return true if status == 'finch encoders reset'

    return false if status == 'false'
    return false if status == 'Not Connected'
    return false if status == 'Invalid orientation'

    nil
  end

  def self.xyz_response(device, sensor, type_method = 'to_f')
    return nil if (x = response_body('hummingbird', 'in', sensor, 'X', device)).nil?

    y = response_body('hummingbird', 'in', sensor, 'Y', device)
    z = response_body('hummingbird', 'in', sensor, 'Z', device)

    [x.send(type_method), y.send(type_method), z.send(type_method)]
  end

  def self.calculate_angle(angle)
    angle * 255 / 180
  end

  def self.calculate_intensity(intensity)
    intensity * 255 / 100
  end

  def self.calculate_speed(speed)
    return 255 if speed.between?(-10, 10)

    # QUESTION: why this calculation instead of normal mapping to 0..255 (and 255 means stop)
    ((speed * 23 / 100) + 122)
  end

  def self.calculate_left_or_right(direction)
    return 'Left' if direction == BirdbrainDevice::LEFT
    return 'Right' if direction == BirdbrainDevice::RIGHT

    false
  end

  def self.bounds(input, input_min, input_max, pass_through_input = nil)
    return input if !pass_through_input.nil? && (input == pass_through_input)

    return input_min if input < input_min
    return input_max if input > input_max

    input
  end
end
