class Recipe < ApplicationRecord
  belongs_to :creator
  belongs_to :spice
  belongs_to :category
  validates  :name, presence: true, length: { minimum: 2 } # , uniqueness: true

  def self.search(search)
    if search
      # where(["name LIKE ?", "%#{search}%"])
      where(name: search)
    else
      all
    end
  end
end
