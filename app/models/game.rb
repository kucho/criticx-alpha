class Game < ApplicationRecord
  has_many :involved_companies
  has_many :companies, through: :involved_companies
  has_many :expansions, class_name: 'Game', foreign_key: :parent_id
  has_many :reviews, as: :reviewable
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres
  belongs_to :parent, class_name: 'Game', optional: true

  enum category: { main_game: 0, expansion: 1 }

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :parent_id, parent_game: true
end