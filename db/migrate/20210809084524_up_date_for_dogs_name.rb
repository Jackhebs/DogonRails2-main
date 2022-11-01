class UpDateForDogsName < ActiveRecord::Migration[6.1]
  def change
    change_column_null :dogs, :name,false
  end
end
