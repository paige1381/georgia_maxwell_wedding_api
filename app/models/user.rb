class User < ApplicationRecord
  has_many :rsvps
  has_secure_password
end
