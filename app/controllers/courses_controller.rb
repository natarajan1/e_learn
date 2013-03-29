class CoursesController < ApplicationController
	#before_filter :authenticate_user!, only:[:create, :edit, :update ,:destroy]
	before_filter :admin_user_check, :only => [:new, :edit, :create, :destroy]
	def new
		@course=Course.new
	end

	def create
		#log=Logger.new("./test.Logger")
    #log.debug "mani"
    #log.debug params[:id]
    @category=Category.find(params[:id])
    @course = @category.courses.build(params[:course])
		#@course=Course.new(params[:course])
		if(params[:course][:course_image]!=nil)
			name=params[:course][:course_image].original_filename
			directory="#{Rails.root}/public/uploads"
			path=File.join(directory,name)
			File.open(path,  'wb') { |f| f.write(params[:course][:course_image].read)}
			@course.course_image=name
		end
		if @course.save
			flash[:success]="Course added Successfully. "
			redirect_to @course
		else
			flash[:error]="Incorrect.."
			render 'new'
		end
	end

	def show
		@course=Course.find(params[:id])
		
	end

	def edit
		@course=Course.find(params[:id])
	end

	def update
		@course=Course.find(params[:id])

		if(params[:course][:course_image]!=nil)
			name=params[:course][:course_image].original_filename
			directory="#{Rails.root}/public/uploads"
			path=File.join(directory,name)
			if (File.exists?("#{directory}/"+@course.course_image))
				File.delete("#{directory}/"+@course.course_image)
			end
			
			File.open(path,'wb') {|f| f.write(params[:course][:course_image].read)}
			params[:course][:course_image]=name
		else
			params[:course][:course_image] = @course.courseimage
		end
		if @course.update_attributes(params[:course])
			flash[:success] = "Successfully updated..."
			redirect_to @course
		else
			flash[:error] = "Faliure..."
			render 'edit'
		end

	end

	def index
		@course=Course.all
	end

	def destroy
		@course=Course.find(params[:id])
		if (@course.course_image!=nil && File.exists?("#{Rails.root}/public/uploads/"+@course.course_image))

			File.delete("#{Rails.root}/public/uploads/"+@course.course_image)
		end
		@course.destroy
		flash[:success] = "Successfully Deleted..."
		redirect_to courses_url
	end

end
