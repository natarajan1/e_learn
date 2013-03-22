module CoursesHelper

	private
	def admin_user_check
		authenticate_user!

		if current_user.admin
			return
		else
     redirect_to root_url # or whatever
   end
 end
end
