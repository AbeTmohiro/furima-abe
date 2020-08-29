class ItemsController < ApplicationController
  def index
    
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
    return redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    @item.update(item_params) if current_user.id == @item.user.id
    return redirect_to item_path if @item.valid?

    render 'edit'
  end

  def destroy
    @item.destroy if current_user.id == @item.user.id
    redirect_to root_path
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
end
