#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
require 'test_helper'

class BirdbrainMinitest < Minitest::Test
  def assert_xyz_results(xyz)
    assert xyz.is_a?(Array)
    assert xyz.size == 3
    assert xyz[0].is_a?(Float)
    assert xyz[1].is_a?(Float)
    assert xyz[2].is_a?(Float)
  end

  def assert_true_or_false(value)
    if value.is_a?(TrueClass) || value.is_a?(FalseClass)
      assert true
    else
      assert false
    end
  end

  def assert_exception
    yield

    assert false
  rescue BirdbrainException => e
    assert true, e.message
  end

  def assert_nil_response
    BirdbrainRequest.stub(:response, nil) do
      yield

      assert false
    rescue BirdbrainException
      assert true
    end
  end
end
