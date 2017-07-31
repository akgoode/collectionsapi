class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all

    render json: @items
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
    render json: @item
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category, :creator, :img)
  end
end
