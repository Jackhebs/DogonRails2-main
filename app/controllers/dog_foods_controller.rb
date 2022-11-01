# frozen_string_literal: true

class DogFoodsController < ApplicationController
  before_action :set_dog_food, only: %i[show edit update destroy]

  # GET /dog_foods or /dog_foods.json
  def index
    @dog_foods = DogFood.sort_by_names
  end

  # GET /dog_foods/1 or /dog_foods/1.json
  def show; end

  # GET /dog_foods/new
  def new
    @dog_food = DogFood.new
  end

  # GET /dog_foods/1/edit
  def edit; end

  # POST /dog_foods or /dog_foods.json
  def create
    @dog_food = DogFood.new(dog_food_params)

    respond_to do |format|
      if @dog_food.save
        format.html { redirect_to @dog_food, notice: 'Dog food was successfully created.' }
        format.json { render :show, status: :created, location: @dog_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dog_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dog_foods/1 or /dog_foods/1.json
  def update
    respond_to do |format|
      if @dog_food.update(dog_food_params)
        format.html { redirect_to @dog_food, notice: 'Dog food was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dog_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dog_foods/1 or /dog_foods/1.json
  def destroy
    @dog_food.destroy
    respond_to do |format|
      format.html { redirect_to dog_foods_url, notice: 'Dog food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dog_food
    @dog_food = DogFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dog_food_params
    params.require(:dog_food).permit(:dog_id, :food_id)
  end
end
