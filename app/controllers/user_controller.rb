class UserController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:id])
  	if @user.save
  		redirect_to product_url, :notice => 'Signed In!'
  	else
  		render :new
  	end
  end

  def private
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
