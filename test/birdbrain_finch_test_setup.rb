#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_test'

class BirdbrainFinchTestSetup < BirdbrainMinitest
  def setup
    ('A'..'C').each do |device|
      @finch = BirdbrainFinch.connect(device)

      break if @finch.finch?
    rescue BirdbrainException
      next
    end

    @finch_connected = !@finch.nil? && @finch.connected?
  end

  def after_teardown
    @finch.disconnect unless @finch.nil?

    super
  end
end
