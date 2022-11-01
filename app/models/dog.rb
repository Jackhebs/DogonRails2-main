# frozen_string_literal: true

class Dog < ApplicationRecord
  include Filters
  has_one_attached :image
  has_many :dog_foods, dependent: :destroy

  validates :name,
            presence: true,
            format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' },
            length: { minimum: 3, message: 'Dog name must be - minimum 3, maximum 10', maximum: 10 },
            uniqueness: { case_sensitive: false }
  validates :weight,
            presence: true,
            numericality: { greater_than: 0, less_than: 161 }
  validates :birthdate,
            presence: true

  scope :dog_by_name, -> { order('LOWER(name) ASC') }
  scope :name_includes, ->(name) { where(Dog.arel_table[:name].matches("%#{name}%")).order(name: :asc) }
  accepts_nested_attributes_for :dog_foods, allow_destroy: true

  def all_dog_foods
    res = []
    Food.find_each do |food|
      res << DogFood.find_or_initialize_by(food: food, dog: self)
    end
    res
  end
end
