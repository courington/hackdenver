class User
  include MongoMapper::Document

  key :first_name, String
  key :last_name, String
  key :email, String

  has_many :beacons

  def full_name
    "#{first_name} #{last_name}"
  end

end
