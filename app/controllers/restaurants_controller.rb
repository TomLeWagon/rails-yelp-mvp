class RestaurantsController < ApplicationController
  before_action :findRestaurant, only: [:show, :update, :edit ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new # needed to instantiate the form_for
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    if @restaurant.save
      # no need for app/views/restaurants/create.html.erb
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end

  end

  def update
    @restaurant.update(restaurant_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  private

  def findRestaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
