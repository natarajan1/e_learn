class CoursesController < ApplicationController
	before_filter :authenticate_user!, only:[:create, :edit, :update ,:destroy]
	
	def new
		@course=Course.new
	end

	def create
		@course=Course.new(params[:course])
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
		Course.find(params[:id]).destroy
		
		flash[:success] = "Successfully Deleted..."
		redirect_to courses_url
	end


end
