#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainHummingbirdTestSetup < BirdbrainMinitest
  def setup
    ('A'..'C').each do |device|
      @hummingbird = BirdbrainHummingbird.connect(device)

      break if @hummingbird.hummingbird?
    rescue BirdbrainException
      next
    end

    @hummingbird_connected = !@hummingbird.nil? && @hummingbird.connected?
  end

  def after_teardown
    @hummingbird.disconnect unless @hummingbird.nil?

    super
  end
end
