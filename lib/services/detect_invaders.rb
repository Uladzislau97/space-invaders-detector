# frozen_string_literal: true

require './lib/entities/signal_wave'
require './lib/services/find_invaders_coordinates'

# Detects invaders coordinates in sample
class DetectInvaders
  def self.call(raw_radar_signal, raw_known_invaders)
    radar_signal = SignalWave.new(raw_radar_signal)
    known_invaders = raw_known_invaders.map { |raw_invader| SignalWave.new(raw_invader) }

    FindInvadersCoordinates.call(radar_signal, known_invaders)
  end
end
