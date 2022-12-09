class Recipe < ApplicationRecord
  belongs_to :creator
  belongs_to :spice
  belongs_to :category
end
