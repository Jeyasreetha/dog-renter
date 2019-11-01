class DogsController < ApplicationController
  # call the method set_dog before selected actions
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  # No need to be logged-in
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # Read all dogs
    @max = Dog.all.sort_by { |d| d.price }.last.price
    @min = Dog.all.sort_by { |d| d.price }.first.price

    @dogs = Dog.all
    @user = current_user
    breed = params[:breed]
    age = params[:age]
    price = params[:price]
    location = params[:location]
    if breed && age && price
      @dogs = Dog.where(breed: breed, age: age).filter { |dog| dog.price < price.to_i }
    elsif breed && age && !price
      @dogs = Dog.where(age: age, breed: breed)
    elsif breed && price && !age
      @dogs = Dog.where(breed: breed).filter { |dog| dog.price < price.to_i }
    elsif price && age && !breed
      @dogs = Dog.where(age: age).filter { |dog| dog.price < price.to_i }
    elsif price
      @dogs = Dog.where('price >= ? AND price <=?', @min, price)
    elsif breed
      @dogs = Dog.where(breed: breed)
    elsif age
      @dogs = Dog.where(age: age)
    elsif location
      @dogs = Dog.where("location ILIKE ?", "%#{location}%")
    else
      @dogs = Dog.all
    end
    # if params[:breed].present?
    #   @dogs = Dog.where(breed: params[:breed])
    # elsif params[:age].present?
    #   @dogs = Dog.where(age: params[:age])
    # elsif params[:price].present?
    #   @dogs = Dog.where(price: params[:price])
    # else
    #   @dogs = Dog.all
    # end
  end

  def show
    # Read one dog
    # @dog = Dog.find(params[:id])
    # call the dog_policy method show
    authorize @dog
    @renting = Renting.new

    # returns flats with coordinates
    @dogs = Dog.geocoded
    @markers = @dogs.map do |dog|
      { lat: dog.latitude,
        lng: dog.longitude,
        infoWindow: render_to_string(partial: "location", locals: { dog: dog })}
    end
  end

  def new
    # opens an empty form
    @dog = Dog.new
    # calls the dog_policy method new
    authorize @dog
  end

  def create
    # Create a new instance with params
    @dog = Dog.new(dog_params)
    authorize @dog
    # Need to be logged-in to add dog listing
    @dog.user = current_user
    if @dog.save
      # Go to the show page of the created dog
      redirect_to dog_path(@dog)
    else
      render 'new'
    end
  end

  def edit
    # calls the dog_policy method edit
    authorize @dog
    # renders a form already with info to change
    # @dog = Dog.find(params[:id])

  end

  def update
    # Get the dog you want to edit
    # @dog = Dog.find(params[:id])
    # render the form with the info to update
    authorize @dog
    @dog.update(dog_params)
    # Go to the show page of the updated dog
    redirect_to dog_path(@dog)
  end

  def destroy
    authorize @dog
    # Get the dog you want to destroy
    # @dog = Dog.find(params[:id])
    # delete the dog
    @dog.destroy
    # Go to the user(owner) profile page(Dog listing)
    redirect_to dashboard_path
  end

  private

  def dog_params
    # white list
    params.require(:dog).permit(:name, :age, :breed, :location, :price, :image, :image_cache)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
