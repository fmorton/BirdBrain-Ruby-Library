#-----------------------------------------------------------------------------------------------------------------------------------
# Copyright (c) 2021 Base2 Incorporated--All Rights Reserved.
#-----------------------------------------------------------------------------------------------------------------------------------
class BirdbrainHummingbirdOutput < BirdbrainRequest
  def self.led(device, port, intensity)
    request_status(response_body('hummingbird', 'out', 'led', port.to_s, bounds(calculate_intensity(intensity), 0, 255), device))
  end

  def self.tri_led(device, port, r_intensity, g_intensity, b_intensity)
    calc_r = bounds(calculate_intensity(r_intensity), 0, 255)
    calc_g = bounds(calculate_intensity(g_intensity), 0, 255)
    calc_b = bounds(calculate_intensity(b_intensity), 0, 255)

    request_status(response_body('hummingbird', 'out', 'triled', port.to_s, calc_r, calc_g, calc_b, device))
  end

  def self.position_servo(device, port, angle)
    # QUESTION: 254 max (255 is ignored)
    request_status(response_body('hummingbird', 'out', 'servo', port.to_s, bounds(calculate_angle(angle), 0, 254), device))
  end

  def self.rotation_servo(device, port, speed)
    # QUESTION: why this range...255 means stop
    request_status(response_body('hummingbird', 'out', 'rotation', port.to_s, bounds(calculate_speed(speed), 99, 145, 255), device))
  end

  def self.play_note(device, note, beats)
    calc_note = bounds(note, 32, 135)
    calc_beats = bounds(beats, 0, 16) * 1000  # 100=(60000 / TEMPO) where TEMPO=60

    request_status(response_body('hummingbird', 'out', 'playnote', calc_note, calc_beats, device))
  end
end
