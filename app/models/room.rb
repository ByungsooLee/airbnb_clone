class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user
  has_many :photos
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :guest_count, presence: true
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true
end
