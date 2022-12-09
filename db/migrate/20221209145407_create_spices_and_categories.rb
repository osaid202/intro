class CreateSpicesAndCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_spices, id: false do |t|
      t.belongs_to :spice
      t.belongs_to :category
    end
  end
end
