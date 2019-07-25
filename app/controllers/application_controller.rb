class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include SessionHelper

	#filter kiem tra da login hay chua
	before_action :require_login

	def require_login
		#Neu chua loggin
		unless logged_in?
			# chuyen den trang dang nhap
			redirect_to login_path
		end
		
	end

end
