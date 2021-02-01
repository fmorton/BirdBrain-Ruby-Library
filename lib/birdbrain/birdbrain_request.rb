#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'net/http'

class BirdbrainRequest
  def self.uri(*args)
    uri = 'http://127.0.0.1:30061'
    args.flatten.each { |s| uri += "/#{s}" }

    # puts "Test: uri is #{uri}"

    uri
  end

  def self.response(*args)
    response = Net::HTTP.get_response(URI.parse(uri(args)))

    sleep(0.01) # HACK: prevent http requests from overloading the bluebird connector

    response
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

  def self.not_connected?(device)
    !connected?(device)
  end

  def self.request_status(status)
    # puts "Test: request status is #{status.inspect}"

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

    return false if status == 'false'

    nil
  end

  def self.calculate_angle(intensity)
    intensity * 255 / 180
  end

  def self.calculate_intensity(intensity)
    intensity * 255 / 100
  end

  def self.calculate_speed(speed)
    return 255 if speed.between?(-10, 10)

    # QUESTION: why this calculation instead of normal mapping to 0..255 (and 255 means stop)
    ((speed * 23 / 100) + 122)
  end

  def self.bounds(input, input_min, input_max, pass_through_input = nil)
    return input if !pass_through_input.nil? && (input == pass_through_input)

    return input_min if input < input_min
    return input_max if input > input_max

    input
  end
end
