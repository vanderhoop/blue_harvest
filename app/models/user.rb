class User < ActiveRecord::Base
  attr_accessor :ip_address

  before_save :geocode
  geocoded_by :ip_address
  has_secure_password
end
