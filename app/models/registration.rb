class Registration < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_one :user

  after_create :create_user

  private

  # raise

  # def create_user
  #   if registration_signed_in?
  #     user = User.new
  #     user.registration = registration_session
  #   end
  # end
end
