class CreateCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :creators do |t|
      t.string :name
      t.string :nationality

      t.timestamps
    end
  end
end
