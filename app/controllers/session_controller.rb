class SessionController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:id])
  	if user && user.aithenticate(params[:password])
  		redirect_to product_url, :notice => "Logged In!"
  	else
  		flash.now[:alert] = "Invalid email or password!"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to product_url, :notice => "Logged Out"
  end
end
