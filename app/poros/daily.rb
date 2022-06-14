class Daily
  attr_reader :date,
    :sunrise,
    :sunset,
    :max_temp,
    :min_temp,
    :conditions,
    :icon

  def initialize(day)
    @date = day[:dt]
    @sunrise = day[:sunrise]
    @sunset = day[:sunset]
    @max_temp = day[:temp][:max]
    @min_temp = day[:temp][:min]
    @conditions = day[:weather][0][:description]
    @icon = day[:weather][0][:icon]
  end
end
