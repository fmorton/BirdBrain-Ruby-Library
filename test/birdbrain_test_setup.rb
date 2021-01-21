#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainTestSetup < Minitest::Test
  def setup
    @hummingbird = BirdbrainHummingbird.new
  end
end
