# frozen_string_literal: true

class Food < ApplicationRecord
  has_many :dog_foods, dependent: :destroy
  scope :food_by_name, -> { order('Lower(name) ASC') }
  accepts_nested_attributes_for :dog_foods, allow_destroy: true
  enum food_type: { granule: 0,
                    can: 1,
                    barf: 2 }

  validates :food_type, presence: true
  validates :weight, presence: true,
                     numericality: { greater_than: 0, less_than_or_equal_to: 1000, message: 'Value in 0 - 1000' }
  validates :name, presence: true,
                   format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' },
                   length: { maximum: 20, message: 'maximum length is 20' }
end
