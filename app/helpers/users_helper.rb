module UsersHelper


	def image_display(user)
		
			#if (@user.image!=nil && File.exists?("#{directory}/"+@user.image))
			if(user.image!=nil)
				if (user.provider=="facebook"|| user.provider=="google_oauth2" || user.provider=="linkedin")

					if (user.image[0..3]=="http")
						return user.image
					end 
				else
					directory = "#{Rails.root}/public/userimages"
					if (user.image!=nil && File.exists?("#{directory}/"+user.image))
						return  "/userimages/"+user.image
					end

				end
			end
		end

	end
