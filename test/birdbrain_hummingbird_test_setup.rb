#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_minitest'

class BirdbrainHummingbirdTestSetup < BirdbrainMinitest
  def setup
    @hummingbird = BirdbrainHummingbird.new
  end

  def after_teardown
    @hummingbird.stop_all

    super
  end
end
