class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    # debugger
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # POST /users (+ params)
  def create
    # (user + given params).save 
    # User.create(params[:user])
    # => name, email, pass/confirmation
    @user = User.new(user_params)
    if @user.save
      # Success (valid params)
      # GET "/users/#{@user.id}"
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user 
      # redirect_to user_path(@user)
      # redirect_to user_path(@user.id)
      # redirect_to user_path(1) 
      #             => /users/1
      
    else
      # Failure (not valid params)
      render 'new'
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
