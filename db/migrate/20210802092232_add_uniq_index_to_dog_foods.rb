class AddUniqIndexToDogFoods < ActiveRecord::Migration[6.1]
  def change
    add_index :dog_foods, [:dog_id, :food_id], unique: true
  end
end
# dodělat null values  do DB
# pokrýt zbytek modelů integračníma testama + vyhledat si metodu pro scroll selector - vyhodnocení chyby např. již popužité jméno.
# udělat testy pro modely
# zamyslet se na search buttonem na stránce Dogs
# db.seed omrknout a podívat se o čem to je.
# vyhledat stránkování záznamu max 10 then next page