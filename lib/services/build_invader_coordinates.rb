# frozen_string_literal: true

# Build correct format of coordinates output
class BuildInvaderCoordinates
  def self.call(invader, top_left_x, top_left_y)
    {
      top_left: [top_left_x, top_left_y],
      bottom_right: [
        top_left_x + invader.x_size - 1,
        top_left_y + invader.y_size - 1
      ]
    }
  end
end
