#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainFinchOutput < BirdbrainRequest
  def self.move(device, direction, distance, speed)
    calc_direction = 'Forward' if direction == BirdbrainFinch::FORWARD
    calc_direction = 'Backward' if direction == BirdbrainFinch::BACKWARD
    calc_distance = bounds(distance, -10000, 10000)
    calc_speed = bounds(speed, 0, 100)

    request_status(response_body('hummingbird', 'out', 'move', device, calc_direction, calc_distance, calc_speed))
  end

  def self.turn(device, direction, angle, speed)
    calc_direction = calculate_left_or_right(direction)
    calc_angle = bounds(angle, 0, 360)
    calc_speed = bounds(speed, 0, 100)

    request_status(response_body('hummingbird', 'out', 'turn', device, calc_direction, calc_angle, calc_speed))
  end

  def self.motors(device, left_speed, right_speed)
    calc_left_speed = bounds(left_speed, -100, 100)
    calc_right_speed = bounds(right_speed, -100, 100)

    request_status(response_body('hummingbird', 'out', 'wheels', device, calc_left_speed, calc_right_speed))
  end

  def self.stop(device)
    request_status(response_body('hummingbird', 'out', 'stopFinch', device))
  end

  def self.reset_encoders(device)
    request_status(response_body('hummingbird', 'out', 'resetEncoders', device))
  end
end
