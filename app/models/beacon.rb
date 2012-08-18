class Beacon
  include MongoMapper::Document

  key :lat, Float
  key :lng, Float
  key :description, String
  key :duration, Integer

  belongs_to :user

end
