class Forecast
  attr_reader :current, :daily, :hourly
  def initialize(data)
    @current = data[:current]
    @daily = data[:daily][0..4]
    @hourly = data[:hourly]
  end
end
