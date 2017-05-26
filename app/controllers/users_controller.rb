class UsersController < ApplicationController
  before_action :require_sign_in

  def index
  end

  def new
    @user = User.new
  end

  def show
  end


end
