# frozen_string_literal: true

require 'application_system_test_case'
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'
class DogsTest < ApplicationSystemTestCase
  setup do
    @dog = dogs(:dog3)
  end

  test 'load the Homepage' do
    visit dog_foods_url
    click_on 'Home'
    assert_selector 'h1', text: 'Hello There'
  end

  test 'load the About page' do
    visit dog_foods_url
    click_on 'About'
    assert_selector 'h1', text: 'About us'
    assert_selector 'p', text: 'We are gladd to have you here'
  end

  test 'visiting the index' do
    visit dogs_url
    assert_selector 'h1', text: 'Dogs'
  end

  test 'creating a Dog' do
    visit dogs_url
    click_on 'New Dog'

    # fill_in "Birthdate", with: @dog.birthdate
    fill_in 'Name', with: "#{@dog.name}new"
    fill_in 'Weight', with: @dog.weight
    click_on 'Create Dog'

    assert_text 'Dog was successfully created'
    click_on 'Back'
  end

  test 'updating a Dog' do
    visit dogs_url
    click_on 'Edit', match: :first

    # fill_in "Birthdate", with: @dog.birthdate
    fill_in 'Name', with: @dog.name
    fill_in 'Weight', with: @dog.weight
    click_on 'Update Dog'

    assert_text 'Dog was successfully updated'
    click_on 'Back'
  end

  test '"destroying a Dog' do
    visit dogs_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Dog was successfully destroyed'
  end

  test 'Dog was created #2' do
    visit dogs_url
    click_on 'New Dog'
    click_on 'Create Dog'
    refute_nil('Name')
    fill_in 'Name', with: 'Rudolf'
    fill_in 'Weight', with: '34'
    click_on 'Create Dog'
    assert_text 'Dog was successfully created'
  end

  test 'should raise an error' do
    visit dogs_url
    click_on 'New Dog'
    fill_in 'Name', with: nil
    fill_in 'Weight', with: nil
    click_on 'Create Dog'
    assert_text '5 errors prohibited this dog from being saved:'
  end

  test 'Dog name hit error: wrong Weight!' do
    visit dogs_url
    click_on 'New Dog'
    fill_in 'Name', with: 'Bouchac'
    fill_in 'Weight', with: 'oka'
    click_on 'Create Dog'
    assert_text 'Weight is not a number'
  end

  test 'Dog name hit error: wrong Name!' do
    visit dogs_url
    click_on 'New Dog'
    fill_in 'Name', with: '123'
    fill_in 'Weight', with: '44'
    click_on 'Create Dog'
    assert_text 'Name only allows letters'
  end

  test 'Birthdate is workin fine' do
    visit dogs_url
    click_on 'New Dog'
    fill_in 'Name', with: 'Rambo'
    fill_in 'Weight', with: '5'
    click_on 'Create Dog'
    assert_text 'Dog was successfully created'
  end

  test 'Birthdate is not selected' do
    visit dogs_url
    click_on 'New Dog'
    fill_in 'Name', with: 'Brambora'
    fill_in 'Weight', with: '44'
    click_on 'Create Dog'
    assert_text 'Dog was successfully created'
  end

  test 'this dog cannot be created, without weight' do
    visit dogs_url
    click_on 'New Dog'
    fill_in 'Name', with: 'Mypuppy'
    click_on 'Create Dog'
    assert_text 'can\'t be blank'
  end

  test 'search dog' do
    visit dogs_url
    assert_text 'Mia'
    assert_text 'dolar'
    assert_text 'chuj'
    assert_field 'search'
    fill_in 'search', with: 'Dolar'
    click_on 'Search'
    assert_text 'dolar'
    refute_text 'Mia'
    refute_text 'chuj'
  end

  test 'should show blank page' do
    visit dogs_url
    assert_text 'dolar'
    assert_text 'Mia'
    assert_text 'chuj'
    sleep 2
    fill_in 'search', with: 'blah'
    click_on 'Search'
    sleep 2
  end

  test 'should show the dog' do
    visit dogs_path
    click_on 'Show', :match => :first
    sleep 2
  end
end
