class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # def create
  #   @restaurant = Restaurant.new(params[:restaurant_params])
  #   @restaurant.save
  #   redirect_to restaurant_path(@restaurant)
  # end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

# class RestaurantsController < ApplicationController
#   def index
#     @restaurants = Restaurant.all
#   end

#   def new
#     @restaurant = Restaurant.new
#   end

#   def create
#     @restaurant = Restaurant.new(restaurant_params)
#     if @restaurant.save
#       redirect_to restaurant_path(@restaurant)
#     else
#       render :new
#     end
#   end

#   def show
#     @restaurant = Restaurant.find(params[:id])
#   end

#   # def update
#   #   @restaurant = Restaurant.find(params[:id])
#   #   @restaurant.update(params[:restaurant])
#   #   redirect_to restaurant_path(@restaurant)
#   # end

#   private

#   def restaurant_params
#     params.require(:restaurant).permit(:name, :address, :phone_number, :category)
#   end
# end
