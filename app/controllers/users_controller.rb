class UsersController < ApplicationController
	#before_filter :admin_user_check, only: [:index,:show,:edit,:update,:new,:create]
  before_filter :admin_user_check, only: [:edit,:update,:new,:create]
  def new
    @user=User.new
  end
  def create
    @user=User.new(params[:user])
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

