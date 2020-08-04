class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      puts "Found User"
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome Back, #{user.name}!"
    else
      flash.now[:alert] = "Invalid email/password combination."
      render :new
    end
  end

  def destroy
  end
end
