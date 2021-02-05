#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainDevice
  DEFAULT_DEVICE = 'A'
  LEFT = 'L'
  RIGHT = 'R'
  VALID_DEVICES = 'ABC'

  attr_accessor :state
  attr_accessor :connected
  attr_accessor :device

  def initialize(device = DEFAULT_DEVICE)
    self.state = BirdbrainState.new
    self.device = device
    self.connected = nil
  end

  def self.connect(device = DEFAULT_DEVICE, raise_exception_if_no_connection = false)
    raise(BirdbrainException, 'Missing device name') if device.nil?
    raise(BirdbrainException, "Invalid device name: #{device}") unless VALID_DEVICES.include?(device)

    device = new(device)

    device.connect

    raise(BirdbrainException, 'No connection') if raise_exception_if_no_connection && !device.connected?

    device
  end

  def connect
    self.connected = BirdbrainRequest.connected?(device)
    self.connected = nil unless valid_device_type?
    connected
  end

  def connected?
    !!connected
  end

  def disconnect
    BirdbrainRequest.disconnect(device) if connected?

    state.microbit_display_map_clear unless state.nil?

    self.connected = nil
    self.device = nil
    self.state = nil
  end

  def self.find_device
    ('A'..'C').each do |device|
      connected_device = connect(device)

      return connected_device if connected_device.valid_device_type?
    rescue BirdbrainException
      next
    end

    new(nil)
  end

  def microbit?
    BirdbrainMicrobitInput.microbit?(device) if connected?
  end

  def hummingbird?
    BirdbrainHummingbirdInput.hummingbird?(device) if connected?
  end

  def finch?
    BirdbrainFinchInput.finch?(device) if connected?
  end

  def valid?(validate, valid_range)
    return false if validate.nil?

    valid_range.include?(validate.to_s)
  end

  def connected_and_valid?(validate, valid_range)
    valid?(validate, valid_range) && connected?
  end
end
