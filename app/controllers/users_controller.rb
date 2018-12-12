class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
  def index
     @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order('created_at DESC').page(params[:page])
    counts(@user)
    
  end

  def new
     @users = User.new
  end

  def create
      @users = User.new(user_params)

    if @users.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @users
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.favorites
  end  


 private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end



