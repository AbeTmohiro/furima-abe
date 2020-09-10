class ItemsController < ApplicationController
  before_action :select_item, only: [:show,:edit,:update]
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
    render 'new'
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :info,
      :category_id,
      :condition_id,
      :shipping_fee_id,
      :prefecture_id,
      :delivery_day_id,
      :price
    ).merge(user_id: current_user.id)
  end

  def select_item
    @item = Item.find(params[:id])
  end
end
