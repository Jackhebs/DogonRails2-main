# frozen_string_literal: true

require 'application_system_test_case'

class FoodsTest < ApplicationSystemTestCase
  setup do
    @food = foods(:brit_care)
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
    visit foods_url
    assert_selector 'h1', text: 'Foods'
  end

  test 'creating a Food' do
    visit foods_url
    click_on 'New Food'
    fill_in 'Name', with: @food.name
    select 'Barf', from: 'food_food_type'
    fill_in 'Weight', with: @food.weight
    click_on 'Create Food'

    assert_text 'Food was successfully created'
    click_on 'Back'
  end

  test 'updating a Food' do
    visit foods_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @food.name
    select 'Barf', from: 'food_food_type'
    fill_in 'Weight', with: @food.weight
    click_on 'Update Food'

    # assert_all_of_selectors "Type", with: (@food_type)
    assert_text 'Food was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Food' do
    visit foods_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Food was successfully destroyed'
  end

  test 'should show food' do
    visit foods_path
    click_on 'Show', :match => :first
  end

  test 'should not DELETE' do
    visit dogs_url
    page.dismiss_confirm do
      click_on 'Destroy', :match => :first
    end
    refute_text 'Food was successfully destroyed'
  end
end
