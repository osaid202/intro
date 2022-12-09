class Recipe < ApplicationRecord
  belongs_to :creator
  belongs_to :spice
  belongs_to :category
  validates  :name, :description, presence: true, uniqueness: true
end
