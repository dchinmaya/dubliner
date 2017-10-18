class Customer
  def initialize(user_id, name, latitude, longitude)
    self.user_id = user_id
    self.name = name
    self.latitude = latitude
    self.longitude = longitude
  end

  def user_id=(u)
    raise "User id #{u} not an integer" unless u
    @user_id = u.to_i
  end

  def name=(n)
    raise "Name #{n} is not a valid name" unless n
    @name = n
  end

  def latitude=(l)
    raise "latitude #{l} is invalid" unless (l && ((l.to_f.to_s == l) || (l.to_i.to_s == l)))
    @latitude = (l.to_f * Math::PI) / 180
  end

  def longitude=(l)
    raise "longitude #{l} is invalid" unless (l && ((l.to_f.to_s == l) || (l.to_i.to_s == l)))
    @longitude = (l.to_f * Math::PI) / 180
  end

  def distance=(d)
    @distance = d
  end

  def distance
    @distance
  end

  attr_reader :user_id, :latitude, :longitude, :name
end