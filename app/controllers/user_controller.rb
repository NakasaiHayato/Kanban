class UserController < ApplicationController
  before_action :set_user, only: %i(edit update show)

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
