# frozen_string_literal: true

require 'test_helper'

class DogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'the validity - weight cannot be negative' do
    dog = dogs(:dog1)
    dog.weight = -1
    refute dog.valid?
    assert_includes dog.errors[:weight], 'must be greater than 0'
  end

  test 'the validity - weight cannot be over 161kg' do
    dog = dogs(:dog1)
    dog.weight = 169
    refute dog.valid?
    assert_equal 'must be less than 161', dog.errors[:weight][0]
    assert_includes dog.errors[:weight], 'must be less than 161'
  end

  test 'the validity - name length have minimum 3 letters' do
    dog = dogs(:dog1)
    dog.name = 'ok'
    refute dog.valid?
    assert_includes dog.errors[:name], 'Dog name must be - minimum 3, maximum 10'
  end

  test 'the validity - name have maximum 10 letters' do
    dog = dogs(:dog1)
    dog.name = 'qwertzuiopa'
    refute dog.valid?
    assert_includes dog.errors[:name], 'Dog name must be - minimum 3, maximum 10'
  end

  test 'the validity - name cannot be blank' do
    dog = dogs(:dog1)
    dog.name = nil
    refute dog.valid?
    assert_includes dog.errors[:name], 'can\'t be blank'
  end

  test 'the validity - weight must be a number' do
    dog = dogs(:dog1)
    dog.weight = 'lalal'
    refute dog.valid?
    assert_includes dog.errors[:weight], 'is not a number'
  end

  test 'the validity - name cannot have special letter, or numbers' do
    dog = dogs(:dog1)
    dog.name = 'ranař9'
    refute dog.valid?
    assert_includes dog.errors[:name], 'only allows letters'
  end
end
