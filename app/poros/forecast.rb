class Forecast
  attr_reader :id, :current, :daily, :hourly
  def initialize(data)
    @id = nil
    @current = data[:current]
    @daily = data[:daily][0..4]
    @hourly = data[:hourly][0..7]
  end
end
