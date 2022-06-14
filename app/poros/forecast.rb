class Forecast
  attr_reader :current, :daily, :hourly
  def initialize(data)
    @current = Current.new(data[:current])
    @daily = create_daily(data[:daily])
    @hourly = create_hourly(data[:hourly])
  end

  def create_daily(days)
    days.map do |day|
      Daily.new(day)
    end
  end

  def create_hourly(hours)
    hours.map do |hour|
      Hourly.new(hour)
    end
  end
end
