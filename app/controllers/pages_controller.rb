class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def dashboard
    @user = current_user
    @rentings = @user.rentings
    @dogs = @user.dogs
  end
end
