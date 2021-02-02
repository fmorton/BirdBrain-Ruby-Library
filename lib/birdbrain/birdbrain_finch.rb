#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainFinch < BirdbrainMicrobit
  FORWARD = 'F'
  BACKWARD = 'B'
  LEFT = 'L'
  RIGHT = 'R'
  MOVE_START_WAIT_SECONDS = 0.15
  MOVE_TIMEOUT_SECONDS = 60.0
  VALID_LED_PORTS = '123'
  VALID_TRILED_PORTS = '1234'
  VALID_SENSOR_PORTS = '123'
  VALID_SERVO_PORTS = '1234'
  VALID_MOVE_DIRECTION = 'FB'
  VALID_TURN_DIRECTION = 'LR'

  attr_accessor :move_start_wait_seconds
  attr_accessor :move_start_time
  attr_accessor :move_timeout_seconds

  def initialize
    super
    self.move_start_wait_seconds = MOVE_START_WAIT_SECONDS # seconds to allow finch to start moving
    self.move_timeout_seconds = MOVE_TIMEOUT_SECONDS # maximum number of seconds to wait for finch moving
    self.move_start_time # after move records how long it took the startup to complete for tuning
  end

  def moving?
    BirdbrainFinchInput.moving?(device) if connected?
  end

  def light(direction)
    BirdbrainFinchInput.light(device, direction) if connected?
  end

  def distance
    BirdbrainFinchInput.distance(device) if connected?
  end

  def line(direction)
    BirdbrainFinchInput.line(device, direction) if connected?
  end


  def beak(r_intensity, g_intensity, b_intensity)
    BirdbrainHummingbirdOutput.tri_led(device, 1, r_intensity, g_intensity, b_intensity) if connected?
  end

  def tail(port, r_intensity, g_intensity, b_intensity)
    if connected?
      if port.to_s == 'all'
        (2..4).each { |i| BirdbrainHummingbirdOutput.tri_led(device, port, r_intensity, g_intensity, b_intensity) }
      else
        if connected_and_valid?(port, VALID_TRILED_PORTS)
          BirdbrainHummingbirdOutput.tri_led(device, port + 1, r_intensity, g_intensity, b_intensity)
        end
      end
    end
  end

  def play_note(note, beats)
    BirdbrainHummingbirdOutput.play_note(device, note, beats) if connected?
  end

  def wait_until_movement
    start_time = Time.now

    sleep(0.01) while !moving? && ((Time.now - start_time) < self.move_start_wait_seconds) # short wait for finch to start moving

    self.move_start_time = Time.now - start_time # close to amount of time it took the finch to startup for tuning

    true
  end

  def wait
    start_time = Time.now

    sleep(0.01) while moving? && ((Time.now - start_time) < self.move_timeout_seconds)

    true
  end

  def wait_until_movement_and_wait
    wait_until_movement
    wait

    true
  end

  def move(direction, distance, speed, wait_to_finish_movement = true)
    if connected_and_valid?(direction, VALID_MOVE_DIRECTION)
      return false if !BirdbrainFinchOutput.move(device, direction, distance, speed)

      wait_until_movement_and_wait if wait_to_finish_movement
    end

    true
  end

  def turn(direction, angle, speed, wait_to_finish_movement = true)
    if connected_and_valid?(direction, VALID_TURN_DIRECTION)
      return false if !BirdbrainFinchOutput.turn(device, direction, angle, speed)

      wait_until_movement_and_wait if wait_to_finish_movement
    end

    true
  end

  def motors(left_speed, right_speed, wait_to_finish_movement = true)
    BirdbrainFinchOutput.motors(device, left_speed, right_speed)  if connected?
  end

  def stop
    BirdbrainFinchOutput.stop(device) if connected?
  end

  def reset_encoders
    BirdbrainFinchOutput.reset_encoders(device) if connected?
  end
end
