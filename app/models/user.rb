class User < ApplicationRecord
  has_secure_password

  has_many :collections
  has_many :games_platforms, through: :collections
end