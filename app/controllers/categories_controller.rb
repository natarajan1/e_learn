class CategoriesController < ApplicationController
	before_filter :authenticate_user!, only:[:create,:edit,:update,:delete]
  def new
  	@category=Category.new
  end

  def create
  	@category=Category.new(params[:category])
  	if @category.save
  		flash[:Success] = "Successfully created..."
  		redirect_to @category
  	else
  		flash[:error] = "Failed..."
  		render 'new'
  	end

  	
  end

  def edit
  	@category=Category.find(params[:id])
  end

  def update
  	@category=Category.find(params[:id])
  	if @category.update_attributes(params[:category])
  		flash[:Success] = "Successfully Updated..."
  		redirect_to @category
  	else
  		flash[:error] = "Failed..."
  		render 'new'
  	end

  	
  end

  def show
  	@category=Category.find(params[:id])
  end

  def index
  	@category=Category.all
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Successfully deleted..."
    redirect_to categories_url
  end
end
