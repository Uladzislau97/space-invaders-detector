# frozen_string_literal: true

require './lib/services/find_invader_coordinates'
require './lib/services/validate_invader'

# Search for all invaders in radar signal
class FindInvadersCoordinates
  def self.call(radar_signal, known_invaders)
    known_invaders.each_with_object([]) do |invader, res|
      next unless ValidateInvader.call(radar_signal, invader)

      coordinates = FindInvaderCoordinates.call(radar_signal, invader)
      coordinates.each { |coord| res.push(coord) }
    end
  end
end
