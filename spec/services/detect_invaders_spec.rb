# frozen_string_literal: true

require './lib/services/detect_invaders'

describe DetectInvaders do
  describe '.call' do
    context 'when there are known invaders in radio signal' do
      it 'returns array of coordinates of top left and bottom right point of inavders' do
        radar_signal = [
          '-----------',
          '-00--------',
          '-----------',
          '-----0-0---',
          '------0--00'
        ].join("\n")

        known_invaders = [
          [
            ['00'],
            ['--']
          ].join("\n"),
          [
            ['0-0'],
            ['-0-']
          ].join("\n")
        ]

        res = described_class.call(radar_signal, known_invaders)
        expect(res).to match(
          [
            hash_including(top_left: [1, 1], bottom_right: [2, 2]),
            hash_including(top_left: [3, 5], bottom_right: [4, 7])
          ]
        )
      end
    end

    context 'when invaders overlap' do
      it 'returns all found coordinates' do
        radar_signal = [
          '-----------',
          '-00--------',
          '-00--------',
          '-----------',
          '-----------'
        ].join("\n")

        known_invaders = [
          [
            ['00'],
            ['00']
          ].join("\n"),
          [
            ['0']
          ].join("\n")
        ]

        res = described_class.call(radar_signal, known_invaders)
        expect(res).to match(
          [
            hash_including(top_left: [1, 1], bottom_right: [2, 2]),
            hash_including(top_left: [1, 1], bottom_right: [1, 1]),
            hash_including(top_left: [1, 2], bottom_right: [1, 2]),
            hash_including(top_left: [2, 1], bottom_right: [2, 1]),
            hash_including(top_left: [2, 2], bottom_right: [2, 2])
          ]
        )
      end
    end

    context 'when there are no known invaders in radar signal' do
      it 'returns an empty array' do
        radar_signal = [
          '-----------',
          '-00--------',
          '-----------',
          '-----0-0---',
          '------0--00'
        ].join("\n")

        known_invaders = [
          [
            ['0000'],
            ['----']
          ].join("\n")
        ]

        res = described_class.call(radar_signal, known_invaders)
        expect(res).to eq([])
      end
    end

    context 'when known inavder width is bigger than radar signal' do
      it 'returns empty array' do
        radar_signal = [
          '---',
          '---',
          '---'
        ].join("\n")

        known_invaders = [
          [
            ['0000'],
            ['----']
          ].join("\n")
        ]

        res = described_class.call(radar_signal, known_invaders)
        expect(res).to eq([])
      end
    end

    context 'when known inavder height is bigger than radar signal' do
      it 'returns empty array' do
        radar_signal = [
          '---',
          '---',
          '---'
        ].join("\n")

        known_invaders = [
          [
            ['00'],
            ['--'],
            ['00'],
            ['--']
          ].join("\n")
        ]

        res = described_class.call(radar_signal, known_invaders)
        expect(res).to eq([])
      end
    end
  end
end
