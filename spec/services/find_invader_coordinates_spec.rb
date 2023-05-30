# frozen_string_literal: true

require './lib/entities/signal_wave'
require './lib/services/find_invader_coordinates'

describe FindInvaderCoordinates do
  let(:radar_signal) do
    SignalWave.new(
      [
        '-0',
        '00'
      ].join("\n")
    )
  end

  let(:single_invader) do
    SignalWave.new('-')
  end

  let(:multiple_invader) do
    SignalWave.new('0')
  end

  let(:non_existed_invader) do
    SignalWave.new('--')
  end

  describe '.call' do
    context 'when invader found once' do
      it 'returns coordinates of invaders' do
        expect(described_class.call(radar_signal, single_invader)).to match(
          [
            hash_including(top_left: [0, 0], bottom_right: [0, 0])
          ]
        )
      end
    end

    context 'when invader found many times' do
      it 'returns all coordinates of invaders' do
        expect(described_class.call(radar_signal, multiple_invader)).to match(
          [
            hash_including(top_left: [0, 1], bottom_right: [0, 1]),
            hash_including(top_left: [1, 0], bottom_right: [1, 0]),
            hash_including(top_left: [1, 1], bottom_right: [1, 1])
          ]
        )
      end
    end

    context 'when inavder not found' do
      it 'returns empty array' do
        expect(described_class.call(radar_signal, non_existed_invader)).to eq([])
      end
    end
  end
end
