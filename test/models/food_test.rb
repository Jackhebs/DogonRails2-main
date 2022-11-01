# frozen_string_literal: true

require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'the validity - weight cannot be negative' do
    food = foods(:brit_care)
    food.weight = -1
    refute food.valid?
    assert_includes food.errors[:weight], 'Value in 0 - 1000'
  end

  test 'the validity - weight cannot be over maximum set to 1000' do
    food = foods(:brit_care)
    food.weight = 1001
    refute food.valid?
    assert_includes food.errors[:weight], 'Value in 0 - 1000'
  end
  test 'the validity name cannot be over maximum that is set to 20' do
    food = foods(:brit_care)
    food.name = 'qwertzuiopqwertzuiopd'
    refute food.valid?
    assert_includes food.errors[:name], 'maximum length is 20'
  end
  test 'the validity - name cannot have special symbols or number' do
    food = foods(:brit_care)
    food.name = '3bitepremium'
    refute food.valid?
    assert_includes food.errors[:name], 'only allows letters'
  end
end
