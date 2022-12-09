class Creator < ApplicationRecord
  has_many :recipes
  has_and_belongs_to_many :spices

  # validates_associated :recipes
  validates :name, presence: true, uniqueness: true
end
