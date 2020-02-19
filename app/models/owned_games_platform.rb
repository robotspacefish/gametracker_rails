class OwnedGamesPlatform < ApplicationRecord
  belongs_to :user
  belongs_to :games_platform
end