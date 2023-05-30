# frozen_string_literal: true

require './lib/entities/signal_wave'
require './lib/services/find_invaders_coordinates'

describe FindInvadersCoordinates do
  let(:radar_signal) do
    SignalWave.new(
      [
        '-0--',
        '000-',
        '----'
      ].join("\n")
    )
  end

  let(:known_invaders) do
    [
      SignalWave.new('0-'),
      SignalWave.new('00')
    ]
  end

  let(:non_existed_invaders) do
    [
      SignalWave.new('0-0'),
      SignalWave.new('-00')
    ]
  end

  describe '.call' do
    context 'when invaders are found' do
      it 'returns coordinates of all invaders' do
        expect(described_class.call(radar_signal, known_invaders)).to match(
          [
            hash_including(top_left: [0, 1], bottom_right: [0, 2]),
            hash_including(top_left: [1, 2], bottom_right: [1, 3]),
            hash_including(top_left: [1, 0], bottom_right: [1, 1]),
            hash_including(top_left: [1, 1], bottom_right: [1, 2])
          ]
        )
      end
    end

    context 'when invaders are not found' do
      it 'returns empty array' do
        expect(described_class.call(radar_signal, non_existed_invaders)).to eq([])
      end
    end
  end
end
