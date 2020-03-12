class UsersController < ApplicationController

  before_action :forbid_test_user, {only: [:edit,:update]}

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def forbid_test_user
    if current_user.email == "test@gmail.com"
      flash[:notice] = "テストユーザーのため変更できません"
      redirect_to root_path
    end
  end

end
