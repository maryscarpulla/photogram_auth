class UsersController < ActionController::Base
  def index
    @user = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])

    render("users/show.html.erb")
  end

  end
