class RegistrationsController < Devise::RegistrationsController
	
	#before_filter :admin_user_check, only: [:edit,:update,:new,:create]
	def new
		super
	end

	def create

		@user=User.new(params[:user])
		if (params[:user][:image]!=nil)
			file_name=params[:user][:image].original_filename
			directory="#{Rails.root}/public/userimages"
			path=File.join(directory,file_name)
			File.open(path,'wb'){|f| f.write(params[:user][:image].read)}
			@user.image=file_name

		end
		if @user.save
			sign_in @user
			flash[:success] = "Successfully created..."
			redirect_to @user
		else
			flash[:error] = "Failed to create..."
		end


	end
	def show
		super
	end
	def edit
		super
		
	end

	def update


		if (params[:user][:image] !=nil)
			#log=Logger.new("./test.Logger")
			#log.debug "#{params[:user][:image]}"
			name = params[:user][:image].original_filename
			directory = "#{Rails.root}/public/userimages"
			if (@user.image!=nil && File.exists?("#{directory}/"+@user.image))
				File.delete("#{directory}/" +@user.image)  
			end
			path = File.join(directory, name)
			File.open(path, "wb") { |f| f.write(params[:user][:image].read) }
			params[:user][:image] = name
		else
			params[:user][:image] = @user.image
		end
		super
	end

end
