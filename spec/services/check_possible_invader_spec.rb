# frozen_string_literal: true

require './lib/entities/signal_wave'
require './lib/services/check_possible_invader'

describe CheckPossibleInvader do
  let(:radar_signal) do
    SignalWave.new(
      [
        '-----------',
        '-00--------',
        '-----------',
        '-----0-0---',
        '------0--00'
      ].join("\n")
    )
  end

  let(:invader) do
    SignalWave.new(
      [
        '0-',
        '--'
      ].join("\n")
    )
  end

  describe '.call' do
    context 'when sample is invader' do
      it 'returns true' do
        expect(described_class.call(radar_signal, invader, 1, 2)).to be true
      end
    end

    context 'when sample is not invader' do
      it 'returns false' do
        expect(described_class.call(radar_signal, invader, 2, 2)).to be false
      end
    end
  end
end
