class Language < ApplicationRecord
  enum rarity: %w[exotic standard dead]
  enum script: %w[common dwarvish elvish infernal celestial draconic]

  has_and_belongs_to_many :races, join_table: :language_races

  validates :name, presence: true, uniqueness: true
end
