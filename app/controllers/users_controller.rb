class UsersController < ApplicationController
	before_filter :authenticate_user!, only: [:index,:edit,:update]
  def show
  	@user=User.find(params[:id])
  end

  def index
  	@user=User.all
  end

end