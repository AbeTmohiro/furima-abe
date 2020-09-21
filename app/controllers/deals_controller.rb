class DealsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :select_item, only: [:index, :create]

  def index
    return redirect_to root_path if current_user.id == @item.user_id
    return redirect_to root_path if @item.deal != nil
    @pay_form = PayForm.new
  end

  def create
    @pay_form = PayForm.new(deal_params)
    if @pay_form.valid?
      pay_item
      @pay_form.save
      return redirect_to root_path
    end
    render 'index'
  end

  private
  def deal_params
    params.permit(
      :token,
      :item_id,
      :postal_code,
      :prefecture,
      :city,
      :addresses,
      :building,
      :phone_number
    ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SK']
    Payjp::Charge.create(
      amount: @item.price,
      card: deal_params[:token],
      currency: 'jpy'
    )
  end

  def select_item
    @item = Item.find(params[:item_id])
  end
end

