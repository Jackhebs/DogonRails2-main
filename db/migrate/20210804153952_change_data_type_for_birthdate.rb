class ChangeDataTypeForBirthdate < ActiveRecord::Migration[6.1]
  def change
    change_column :dogs, :birthdate, :date
  end
end
