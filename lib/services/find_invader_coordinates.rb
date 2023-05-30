# frozen_string_literal: true

require './lib/services/check_possible_invader'
require './lib/services/build_invader_coordinates'

# Search for particular invader in radar signal
class FindInvaderCoordinates
  def self.call(radar_signal, invader)
    coordinates = []

    (0..(radar_signal.x_size - invader.x_size)).each do |i|
      (0..(radar_signal.y_size - invader.y_size)).each do |j|
        invader_found = CheckPossibleInvader.call(radar_signal, invader, i, j)
        next unless invader_found

        invader_coordinates = BuildInvaderCoordinates.call(invader, i, j)
        coordinates.push(invader_coordinates)
      end
    end

    coordinates
  end
end
