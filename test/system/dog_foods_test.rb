require "application_system_test_case"

class DogFoodsTest < ApplicationSystemTestCase
  setup do
    @dog_food = dog_foods(:dog_food1)
  end

  test"load the Homepage" do
    visit dog_foods_url
    click_on "Home"
    assert_selector "h1", text: "Hello There"
  end

  test"load the About page" do
    visit dog_foods_url
    click_on "About"
    assert_selector "h1", text: "About us"
    assert_selector "p", text: "We are gladd to have you here"
  end

  test "visiting the index" do
    visit dog_foods_url
    assert_selector "h1", text: "Dog Foods"
  end

  test "creating a Dog food" do
    visit dog_foods_url
    click_on "New Dog Food"

    select "chuj", from: "dog_food_dog_id"
    select "jogies", from: "dog_food_food_id"
    click_on "Create Dog food"
    assert_text "Dog food was successfully created"
    click_on "Back"
  end
  test "creating a Dog food - cannot duplicate existing record" do
    dog_food = DogFood.last
    visit dog_foods_url
    click_on "New Dog Food"

    select dog_food.dog.name, from: "dog_food_dog_id"
    select dog_food.food.name, from: "dog_food_food_id"
    click_on "Create Dog food"
    assert_text "Dog has already been taken"
    click_on "Back"
  end

  test "updating a Dog food" do
    visit dog_foods_url
    click_on "Edit", match: :first

    select "dolar", from: "dog_food_dog_id"
    select "britcare", from: "dog_food_food_id"
    click_on "Update Dog food"

    assert_text "Dog food was successfully updated"
    click_on "Back"
  end

  test "updating a Dog food - cannot update an invalid record" do

    visit dog_foods_url
    click_on "Edit", match: :first

    select "chuj", from: "dog_food_dog_id"
    select "britcare", from: "dog_food_food_id"

    dogs(:dog2).destroy!

    click_on "Update Dog food"
    sleep 6
    assert_text "Dog food was successfully updated"
    click_on "Back"
  end

  test "destroying a Dog food" do
    visit dog_foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dog food was successfully destroyed"
  end
end
