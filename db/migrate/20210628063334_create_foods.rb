class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    #add_column :foods, :type, :integer, default: 0
    #add_index :foods, :type
    create_table :foods do |t|
      t.string :name
      t.integer :food_type, null: false
      t.float :weight

      t.timestamps
    end
  end
end
