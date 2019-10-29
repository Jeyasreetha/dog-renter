class RentingsController < ApplicationController
  def create
    @renting = Renting.new(renting_params)
    @dog.user = current_user
    @dog = dog.find(params[:id])
  end

  private

  def renting_params
    params.require(:renting).permit(:total_price, :start_date, :end_date)
  end
end
