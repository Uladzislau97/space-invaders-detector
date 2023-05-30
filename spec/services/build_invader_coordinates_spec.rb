# frozen_string_literal: true

require './lib/entities/signal_wave'
require './lib/services/build_invader_coordinates'

describe BuildInvaderCoordinates do
  let(:wave) do
    SignalWave.new(
      [
        ['00'],
        ['--']
      ].join("\n")
    )
  end

  describe '.call' do
    it 'returns hash based on invader and coordinates' do
      expect(described_class.call(wave, 2, 3)).to include(
        top_left: [2, 3], bottom_right: [3, 4]
      )
    end
  end
end
