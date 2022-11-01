require "test_helper"

class DogFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dog_food = dog_foods(:dog_food1)
  end

  test "should get index" do
    get dog_foods_url(@dog_foods)
    assert_response :success
  end

  test "should get new" do
    get new_dog_food_url
    assert_response :success
  end

  test "should create dog_food" do
    assert_difference('DogFood.count') do
      post dog_foods_url, params: { dog_food: { dog_id: @dog_food.dog_id, food_id: @dog_food.food_id } }
    end

    assert_redirected_to dog_food_url(DogFood.last)
  end

  test "should show dog_food" do
    get dog_food_url(@dog_food)
    assert_response :success
  end

  test "should get edit" do
    get edit_dog_food_url(@dog_food)
    assert_response :success
  end

  test "should update dog_food" do
    patch dog_food_url(@dog_food), params: { dog_food: { dog_id: @dog_food.dog_id, food_id: @dog_food.food_id } }
    assert_redirected_to dog_food_url(@dog_food)
  end

  test "should destroy dog_food" do
    assert_difference('DogFood.count', -1) do
      delete dog_food_url(@dog_food)
    end

    assert_redirected_to dog_foods_url
  end
end
