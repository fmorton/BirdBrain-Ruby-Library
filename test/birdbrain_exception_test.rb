#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'birdbrain_minitest'

class BirdbrainExceptionTest < BirdbrainMinitest
  def test_no_connection_no_connection_again
    BirdbrainRequest.stub(:response, nil) do
      @hummingbird = BirdbrainHummingbird.new

      assert false
    rescue BirdbrainException
      assert true
    end
  end

  def test_no_connection_no_connection_old
    assert_nil_response { @hummingbird = BirdbrainHummingbird.new }
  end

  def test_exception_test_lost_connection
    @hummingbird = BirdbrainHummingbird.new
  end
end
