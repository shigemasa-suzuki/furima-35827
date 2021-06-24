class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_item, only: [:edit,:show,:update,:destroy]
  before_action :move_to_index,only: [:edit,:update,:destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end 

  def new
    @item = ItemsTag.new
  end

  def create
    @item = ItemsTag.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
      else
        render :new
    end
  end

  def show
    @message = Message.new
    @messages = @item.messages.includes(:user)
  end

  def edit
  
  end

  def update

    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private
  def item_params
    params.require(:items_tag).permit(:tag, :name, :info, :category_id,:status_id,:shipping_fee_id,:shipping_area_id ,:day_to_ship_id,:price,images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id || @item.order.present? 
       redirect_to action: :index
    end
  end
end
