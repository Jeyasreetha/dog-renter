class RentingsController < ApplicationController
  def create

    @renting = Renting.new(renting_params)
    @dog = Dog.find(params[:dog_id])
    authorize @dog
    @renting.dog = @dog
    @renting.user = current_user
    @renting.total_price = (@renting.end - @renting.start) / 86_400 * @dog.price
    if @renting.save
      redirect_to dashboard_path
    else
      render 'dogs/show'
    end
  end

  private

  def renting_params
    params.require(:renting).permit(:start, :end)
  end
end
