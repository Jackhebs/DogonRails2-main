class AddUniqIndexToDogs < ActiveRecord::Migration[6.1]
  def change
    add_index :dogs, [:name], unique: true
    # case insensitive
    # null values √
    # muzeme validovat delku v DB? √
    # migrace zpet - rollback √
  end
end

