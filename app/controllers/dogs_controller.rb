# frozen_string_literal: true

class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update destroy]

  # GET /dogs or /dogs.json
  def index
    # return search_dog if params[:search]

    @dogs = Dog.dog_by_name.paginate(page: params[:page], per_page: 5)
    @dogs = @dogs.name_includes(params[:search]) if params[:search].present?
  end

  # GET /dogs/1 or /dogs/1.json
  def show; end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit; end

  # GET /dogs/1/search
  def search_dog
    if (@dog = Dog.name_includes(params[:search]).first)
      redirect_to @dog, notice: 'Dog searched'
    else
      redirect_to dogs_path, notice: 'Dog not found'
    end
  end

  # POST /dogs or /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1 or /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1 or /dogs/1.json
  def destroy
    @dog.dog_foods.each(&:destroy)
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dog
    @dog = Dog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dog_params
    params.require(:dog).permit(:name, :weight, :image, :birthdate, dog_foods_attributes: %i[id _destroy food_id])
  end
end
