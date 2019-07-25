class SessionController < ApplicationController

  #Loai bo ham kiem tra da login hay chua khi vao trang dang nhap
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
  	user = User.find_by name: params[:session][:name].downcase
  	if user && user.authenticate(params[:session][:password])
  		flash[:success] = "Login success #{user.id}"
  		log_in user
  		redirect_to user
  	else
  		flash[:danger] = "Invaild email/password combination"
  		render :new
  	end
  end

  def destroy
  	log_out
  	flash[:success] = "You are logged out"
  	redirect_to login_path
  end

end
