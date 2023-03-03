class UsersController < ApplicationController
  def show
    @shoes = Shoe.where(user_id: current_user.id)
  end
end
