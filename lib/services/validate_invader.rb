# frozen_string_literal: true

# Validates if possible invader not bigger then radio signal input
class ValidateInvader
  def self.call(radar_signal, invader)
    invader.x_size <= radar_signal.x_size && invader.y_size <= radar_signal.y_size
  end
end
