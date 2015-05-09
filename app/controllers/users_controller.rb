class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(create_params)
  	if @user.save
  	  redirect_to users_path, notice: '保存しました'
  	else
  	  render :new, notice: '保存に失敗しました'
  	end
  end

  def show
  	@user = User.find(params[:id])
    @okans = User.within_box(2, @user.latitude, @user.longitude).where.not( id: @user.id )
  end

  private

    def create_params
      params.require(:user).permit(:name, :address, :latitude, :longitude)
    end
    
end
