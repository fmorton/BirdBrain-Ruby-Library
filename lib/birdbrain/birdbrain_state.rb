#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainState
  attr_accessor :microbit_display_map

  def initialize
    microbit_display_map_clear
  end

  def microbit_display_map_clear
    self.microbit_display_map = BirdbrainState.microbit_empty_display_map
  end

  def microbit_display_map_as_strings
    microbit_display_map.collect { |pixel| ((pixel == 1) ? 'true' : 'false') }
  end

  def self.microbit_empty_display_map
    [0] * 25
  end
end
