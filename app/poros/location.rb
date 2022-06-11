class Location
  attr_reader :id, :lat, :lng
  def initialize(data)
    @id = nil
    @lat = data[:lat]
    @lng = data[:lng]
  end
end
