class UsersController < ApplicationController

<<<<<<< HEAD
	def show
		@user = User.find(params[:id])
	end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Welcome to Superkurjers"
  		redirect_to @user
  	else
  		render 'new'
  	end
=======
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Superkurjers!"
      redirect_to @user
    else
      render 'new'
    end
>>>>>>> new_state
  end
end
