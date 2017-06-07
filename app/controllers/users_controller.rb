class UsersController < ApplicationController
  before_action :require_sign_in

  def index
    @users = User.all
  end

  def new
  end

  def show
    if current_user
      @user = params[:id] ? User.find(params[:id]) : current_user
      # @user_bookmarks = @user.bookmarks
      @topics = @user.topics
    else
      redirect_to new_user_registration_path
    end
  end


end
