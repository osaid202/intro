class Category < ApplicationRecord
  has_many :recipes
  has_and_belongs_to_many :spices
end
