class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :contributor_soldout_confirmation

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code,
                                       :prefecture_id,
                                       :municipality,
                                       :address,
                                       :building_name,
                                       :phone_number).merge(
                                        user_id: current_user.id,
                                        item_id: params[:item_id]
                                       )
  end

  #SoldOutの条件を後ほど追加
  def contributor_soldout_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
  end

  def pay_item
  end
  
end
