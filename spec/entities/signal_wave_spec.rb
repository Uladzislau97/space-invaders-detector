# frozen_string_literal: true

require './lib/entities/signal_wave'

describe SignalWave do
  let(:signal) do
    described_class.new(
      [
        '-0-0',
        '00--',
        '----'
      ].join("\n")
    )
  end

  describe '.size_x' do
    it 'returns length of outer coordinates array' do
      expect(signal.x_size).to eq(3)
    end
  end

  describe '.size_y' do
    it 'returns length of inner coordinates array' do
      expect(signal.y_size).to eq(4)
    end
  end
end
