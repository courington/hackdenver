class Beacon
  include MongoMapper::Document

  key :lat, String
  key :lng, String
  key :description, String
  key :duration, Integer

  belongs_to :user

end
