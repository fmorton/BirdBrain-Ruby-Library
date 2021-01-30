#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
module Birdbrain
  class Error < StandardError; end

  require_relative 'birdbrain/version'
  require_relative 'birdbrain/birdbrain_device'
  require_relative 'birdbrain/birdbrain_exception'
  require_relative 'birdbrain/birdbrain_state'
  require_relative 'birdbrain/birdbrain_request'
  require_relative 'birdbrain/birdbrain_microbit_input'
  require_relative 'birdbrain/birdbrain_microbit_output'
  require_relative 'birdbrain/birdbrain_input'
  require_relative 'birdbrain/birdbrain_output'
  require_relative 'birdbrain/birdbrain_microbit'
  require_relative 'birdbrain/birdbrain_hummingbird'
  require_relative 'birdbrain/birdbrain_finch'
end
