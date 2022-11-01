class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :weight
      t.datetime :birthdate

      t.timestamps
    end
  end
end
