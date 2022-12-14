class Category < ApplicationRecord
  has_many :recipes
  has_and_belongs_to_many :spices

  validates :name, presence: true, length: { minimum: 2 } # , uniqueness: true
end
