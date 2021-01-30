#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainDevice
  DEFAULT_DEVICE = 'A'
  VALID_DEVICES = 'ABC'

  attr_accessor :state
  attr_accessor :connected
  attr_accessor :device

  def initialize(device = DEFAULT_DEVICE)
    raise(BirdbrainException, 'Missing device name') if device.nil?
    raise(BirdbrainException, "Invalid device name: #{device}") unless VALID_DEVICES.include?(device)

    self.state = BirdbrainState.new
    self.device = device
    self.connected = BirdbrainRequest.connected?(device)

    raise(BirdbrainException, 'No connection') unless connected?
  end

  def connected?
    connected
  end

  def stop_all
    BirdbrainHummingbirdOutput.stop_all(device) if connected?

    state.microbit_display_map_clear unless state.nil?

    self.connected = false
    self.device = nil
    self.state = nil
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

  def connected_and_valid?(validate, valid_range)
    return true if !validate.nil? && valid_range.include?(validate.to_s) && connected?

    calling_method = caller[0]

    message = (calling_method == 'button') ? "Invalid button: #{validate}" : "Invalid #{calling_method} port: #{validate}"

    raise(BirdbrainException, message)
  end
end
