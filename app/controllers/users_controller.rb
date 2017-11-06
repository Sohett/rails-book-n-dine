class UsersController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def show
    #code
  end

  def new
    #code
  end

  def create
    #code
  end

  private

  def set_user
    @user = User.find(params########)
  end

  def user_params
    params.require(:user).permit(:owner, :last_name, :first_name, :phone_number, :registration_id)
  end
end
