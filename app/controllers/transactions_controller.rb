class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user_id
  end
end
