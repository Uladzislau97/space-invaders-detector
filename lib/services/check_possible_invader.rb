# frozen_string_literal: true

# Check sample of radar data to be an invader
class CheckPossibleInvader
  def self.call(radar_signal, invader, start_x, start_y)
    (0...invader.x_size).each do |x|
      (0...invader.y_size).each do |y|
        return false unless radar_signal.data[start_x + x][start_y + y] == invader.data[x][y]
      end
    end

    true
  end
end
