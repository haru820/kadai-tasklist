class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'Signed Up!!'
      #セッション構築
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:danger] = 'Failed,,,,'
      render :new
    end
  end
  
  private
  #未使用のため削除
  #def set_user
  #  @user = User.find(params[:id])
  #end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
