class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :games_platform

  has_many :notes
end