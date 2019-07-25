class UsersController < ApplicationController

	#Loai bo ham kiem tra da login hay chua khi vao trang dang nhap
  	skip_before_action :require_login, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new user_param

		if @user.save
			flash[:success] = "Register Success"
			redirect_to login_path
		else
			flash[:danger] = "Register Failed"
			render :new
		end
		
	end

	
	private def user_param
		params.require(:user).permit :name, :password, :password_confirmation
		
	end

	def show
		@user = User.find_by id: params[:id]
	end

	def index
		@users = User.all
	end
end
