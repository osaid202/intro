class CreateSpicesAndCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :spices_creators, id: false do |t|
      t.belongs_to :spice
      t.belongs_to :creator
    end
  end
end
