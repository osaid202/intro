class Spice < ApplicationRecord
  has_many :recipes
  has_and_belongs_to_many :creators
  has_and_belongs_to_many :categories

  validates :name, presence: true, uniqueness: true
end
