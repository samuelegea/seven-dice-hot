class Language < ApplicationRecord
  enum rarity: %w[exotic standard dead]
  enum script: %w[common dwarvish elvish infernal celestial draconic]

  validates :name, presence: true, uniqueness: true
end
