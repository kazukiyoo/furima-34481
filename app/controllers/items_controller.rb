class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :update, :edit]
  before_action :item, only: [:show, :edit, :update]
  before_action :current, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to "/items/#{@item.id}"
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :price, :description, :status_id, :prefecture_id, :burden_id, :days_to_delivery_id, :category_id).merge(user_id: current_user.id)
  end

  def item
    @item = Item.find(params[:id])
  end

  def current
    if current_user.id != @item.user.id
      redirect_to action: :index
    end
  end
end
