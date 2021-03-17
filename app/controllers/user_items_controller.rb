class UserItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_user_item = PurchaseUserItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_user_item = PurchaseUserItem.new(purchase_user_params)

    if @purchase_user_item.valid?
      pay_item
      @purchase_user_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

 private

 def purchase_user_params
   params.require(:purchase_user_item).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  
    card: purchase_user_params[:token],    
    currency: 'jpy'                 
  )
 end
end
