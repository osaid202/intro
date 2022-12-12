class Recipe < ApplicationRecord
  belongs_to :creator
  belongs_to :spice
  belongs_to :category
  validates  :name, presence: true, length: { minimum: 2 } # , uniqueness: true

  def self.search(search, category)
    if !search.to_s.strip.empty? && !category.to_s.strip.empty?
      # where(["name LIKE ?", "%#{search}%"])
      # where(name: search)
      where(["name= ? and category_id= ?", search, Category.where(name: category).first.id])
    elsif !search.to_s.strip.empty?
      where(name: search)

    elsif !category.to_s.strip.empty?
      where(category_id: Category.where(name: category).first.id)
    else
      all
    end
  end
end
