class User < ApplicationRecord
  has_secure_password

  has_many :games_platforms_users
  has_many :games_platforms, through: :games_platforms_users
end