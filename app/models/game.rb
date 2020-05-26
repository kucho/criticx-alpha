class Game < ApplicationRecord
  has_many :involved_companies
  has_many :companies, through: :involved_companies
  has_many :expansions, class_name: 'Game', foreign_key: :parent_id
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres
  belongs_to :parent, class_name: 'Game', optional: true
end
