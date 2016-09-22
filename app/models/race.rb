class Race < ApplicationRecord
  scope :by_name_date, -> { order(:name, date: "DESC") }
  
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
  validates :climate, presence: true
  validates :temp_high, presence: true
  validates :temp_low, presence: true
end
