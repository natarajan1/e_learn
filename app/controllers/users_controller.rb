class UsersController < ApplicationController
	#before_filter :admin_user_check, only: [:index,:show,:edit,:update,:new,:create]
  before_filter :admin_user_check, only: [:edit,:update,:destroy]
  def new
    @user=User.new
  end
  def create

    @user=User.new(params[:user])
    if(params[:user][:image]!=nil)
      file_name=params[:user][:image].original_filename
      directory="#{Rails.root}/public/userimages"
      path=File.join(directory,file_name)
      File.open(path, "wb") { |f| f.write(parmas[:user][:image].read) }
      @user.image=file_name
    end
    if @user.save
      flash[:success] = "Successfully created..."
      redirect_to root_url
    else
      flash[:error] = "Faild to create..."
      render 'new'
    end
  end
  def show
  	@user=User.find(params[:id])
  end

  def index
  	@user=User.all
  end

  def edit
    @user=User.find(params[:id])
  end
  def update
    @user=User.find(params[:id])

    if(params[:user][:image]!=nil)
      file_name=params[:user][:image].original_filename
      directory="#{Rails.root}/public/userimages"
      path=File.join(directory,file_name)

      if(@user.image!=nil && File.exists?("#{directory}/"+@user.image))
        File.delete("#{directory}"+@user.image)
      end
      File.open(path, "wb") { |f| f.write(params[:user][:image].read)}
      params[:user][:image]=file_name      
    else
      params[:user][:image]=@user.image

    end
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully Updated..."
      redirect_to users_url
    else
      flash[:error] = "Failed to Update"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Successfully Deleted..."
    redirect_to users_url
  end
end

