#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_minitest'

class BirdbrainFinchTestSetup < BirdbrainMinitest
  def setup
    @finch = BirdbrainFinch.new
  end

  def after_teardown
    @finch.disconnect

    super
  end
end