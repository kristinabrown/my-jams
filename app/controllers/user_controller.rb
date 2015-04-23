require 'byebug'
class UserController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end
  
  
  private
   
  def user_params
    params.require(:user).permit(:first_name, 
                                 :last_name, 
                                 :username, 
                                 :password, 
                                 :password_confirmation)
                                 
  end
end