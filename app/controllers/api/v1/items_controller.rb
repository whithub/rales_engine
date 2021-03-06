class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def random
    render json: Item.all.sample
  end

  def find
    render json: Item.find_by(find_params)
  end

  def find_all
    render json: Item.where(find_params)
  end

  def merchant
    render json: find_item.merchant
  end

  def invoice_items
    render json: find_item.invoice_items
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end

  def find_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

  def find_item
    Item.find_by(id: params[:item_id])
  end
end
