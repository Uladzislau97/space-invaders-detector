# frozen_string_literal: true

# Class for working with signal data
class SignalWave
  attr_reader :data

  def initialize(radar_signal)
    @data = radar_signal.split("\n").map(&:chars)
  end

  def x_size
    @data.length
  end

  def y_size
    @data.first.length
  end
end
