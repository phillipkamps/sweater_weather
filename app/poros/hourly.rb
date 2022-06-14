class Hourly
  attr_reader :time,
    :temperature,
    :conditions,
    :icon

  def initialize(hour)
    @time = hour[:dt]
    @temperature = hour[:temp]
    @conditions = hour[:weather][0][:description]
    @icon = hour[:weather][0][:icon]
  end
end
