class StoresController < ApplicationController
  def index
  	@stores = Store.all
  end

  def new
  	@store = Store.new
  end

  def create
  	@store = Store.new(create_params)
  	if @store.save
      Store.fetch_place(:address)
  	  redirect_to stores_path, notice: '保存しました'
  	else
  	  render :new, notice: '保存に失敗しました'
  	end
  end

  def show
  	@store = Store.find(params[:id])
  end

  private

    def create_params
      params.require(:store).permit(:name, :address, :latitude, :longitude)
    end

end
