module SessionHelper

	def log_in user
		session[:user_id] = user.id
	end

	def log_out
		session.delete :user_id
	end

	def current_user
		# x||= y : neu x nill or false thi x = y
		@current_user ||= User.find_by id: session[:user_id]
	end

	# tra ve true neu ton taim false neu khong ton tai user trong session
	def logged_in?
		current_user.present?
	end

	

end
