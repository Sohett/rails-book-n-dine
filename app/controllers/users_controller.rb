class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
    #code
  end

  def update
    #code
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:owner, :last_name, :first_name, :phone_number, :registration_id)
  end
end
