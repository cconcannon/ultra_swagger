class Item < ApplicationRecord
  has_many :reviews
  
  scope :shoes, -> { where(type: "Shoe") }
  scope :outerwears, -> { where(type: "Outerwear") }
  scope :base_layers, -> { where(type: "Base Layer") }
  scope :hydration_packs, -> { where(type: "Hydration Pack") }
  scope :by_brand_model, -> { order(:brand, :model, :sex) }
  
  def self.types
    %w(Shoe, Outerwear, Base Layer, Hydration Pack)
  end
end
