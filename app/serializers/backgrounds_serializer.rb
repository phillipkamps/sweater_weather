class BackgroundsSerializer
  include JSONAPI::Serializer
  attributes :image_url, :creator, :id
end
