class Note < ApplicationRecord
  belongs_to :owned_game

  scope :sort_newest_first, -> { order(created_at: :desc)}
end