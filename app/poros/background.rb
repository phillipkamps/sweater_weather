class Background
  attr_reader :image_url, :creator, :id
  def initialize(data)
    @id = data[:id]
    @image_url = data[:urls][:regular]
    @creator = data[:user][:name]
  end
end
