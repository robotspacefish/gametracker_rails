class Platform < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :games_platforms
  has_many :games, through: :games_platforms

  def self.setup_platforms
    platforms = IgdbApi.retrieve_platforms_from_api
    self.add_platforms_to_db(platforms)
  end

  def self.add_platforms_to_db(platforms)
    platforms.each do |platform|
      self.create(platform)
    end
  end
end
