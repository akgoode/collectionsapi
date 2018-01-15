class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :options, :update]
  after_action :add_headers, only: [:options, :create, :delete, :update]

  def index
    @items = Item.all

    render json: @items
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      head :no_content
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  def options
    render plain: "STATUS OK", status: :ok
  end

  protected

  def add_headers
    response.set_header('Access-Control-Allow-Headers', 'Content-Type')
    response.set_header('Access-Control-Allow-Methods', 'POST')
    response.set_header('Access-Control-Allow-Origin', '*')

  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.permit(:name, :headline, :description, :category, :creator, :img)
  end
end
