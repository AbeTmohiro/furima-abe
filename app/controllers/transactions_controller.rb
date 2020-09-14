class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @item_transaction = PayForm.new(item_transaction_params)
    if @item_transaction.valid?
      pay_item
      @item_transaction.save
      return redirect_to root_path
    end
    render 'index'
  end
end
