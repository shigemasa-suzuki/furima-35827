class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  def index
    @items = Item.all.order("created_at DESC")
  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
      else
        render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name,:info, :image,:category_id,:status_id,:shipping_fee_id,:shipping_area_id ,:day_to_ship_id,:price).merge(user_id: current_user.id)
  end

end
