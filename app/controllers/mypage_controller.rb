class MypageController < ApplicationController

  before_action :move_to_root_path

  def index
    
  end

  def edit
  end

  def show

  end

  def create
  end

  def update
    if current_user.update(user_params)
      flash[:alert] = "変更しました"
      redirect_to mypage_profile_path
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:nickname, :profile_description)
  end

  def move_to_root_path
    redirect_to root_path unless user_signed_in?
  end
end
