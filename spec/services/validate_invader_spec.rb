# frozen_string_literal: true

require './lib/entities/signal_wave'
require './lib/services/validate_invader'

describe ValidateInvader do
  let(:radar_signal) do
    SignalWave.new(
      [
        '---',
        '000',
        '---'
      ].join("\n")
    )
  end

  let(:valid_invader) do
    SignalWave.new(
      [
        '00',
        '--'
      ].join("\n")
    )
  end

  let(:invalid_invader) do
    SignalWave.new(
      [
        '0000',
        '----'
      ].join("\n")
    )
  end

  describe '.call' do
    context 'when invader is within radio signal' do
      it 'returns false' do
        expect(described_class.call(radar_signal, valid_invader)).to be true
      end
    end

    context 'when invader is out of radio signal' do
      it 'returns false' do
        expect(described_class.call(radar_signal, invalid_invader)).to be false
      end
    end
  end
end
