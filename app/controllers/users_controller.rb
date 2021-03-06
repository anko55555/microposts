class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update]
  
  
  def show 
  end
 
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit # 追加
  end
 
 
  def update # 追加
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'your profile updated'
     else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end

  def user_params
    params.require(:user).permit(:name, :email, :area, :profile, :password,
                                 :password_confirmation)
  end
end
