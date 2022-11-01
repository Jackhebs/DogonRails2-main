class CreateDogFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_foods do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
