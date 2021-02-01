#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainFinchOutput < BirdbrainRequest
#  def self.led(device, port, intensity)
#    request_status(response_body('hummingbird', 'out', 'led', port.to_s, bounds(calculate_intensity(intensity), 0, 255), device))
#  end
#
#  def self.tri_led(device, port, r_intensity, g_intensity, b_intensity)
#    calc_r = bounds(calculate_intensity(r_intensity), 0, 255)
#    calc_g = bounds(calculate_intensity(g_intensity), 0, 255)
#    calc_b = bounds(calculate_intensity(b_intensity), 0, 255)
#
#    request_status(response_body('hummingbird', 'out', 'triled', port.to_s, calc_r, calc_g, calc_b, device))
#  end
  def self.move(device, direction, distance, speed)
    calc_direction = 'Forward' if direction == BirdbrainFinch::DIRECTION_FORWARD
    calc_direction = 'Backward' if direction == BirdbrainFinch::DIRECTION_BACKWARD
    calc_distance = bounds(distance, -10000, 10000)
    calc_speed = bounds(speed, 0, 100)

    request_status(response_body('hummingbird', 'out', 'move', device, calc_direction, calc_distance, calc_speed))
  end
end
