class DogFood < ApplicationRecord
  belongs_to :dog
  belongs_to :food
  scope :sort_by_names, -> { joins(:dog, :food).order('LOWER(dogs.name), LOWER(foods.name)') }

  validates_uniqueness_of :dog_id, scope: [:food_id]
end
