class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'users/form'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:owner, :last_name, :first_name, :phone_number, :registration_id, :photo)
  end
end
