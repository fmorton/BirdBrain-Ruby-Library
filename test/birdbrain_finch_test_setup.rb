#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_minitest'

class BirdbrainFinchTestSetup < BirdbrainMinitest
  def setup
    @finch = BirdbrainFinch.new
  end

  def after_teardown
    @finch.stop_all

    super
  end
end