class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def random
    render json: InvoiceItem.all.sample
  end

  def find
    render json: InvoiceItem.find_by(find_params)
  end

  def find_all
    render json: InvoiceItem.where(find_params)
  end

  def item
    render json: find_invoice_item.item
  end

  def invoice
    render json: find_invoice_item.invoice
  end

  private

  def invoice_items_params
    params.require(:invoice_items).permit(:quantity, :unit_price, :item_id, :invoice_id)
  end

  def find_params
    params.permit(:id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
  end

  def find_invoice_item
    InvoiceItems.find_by(id: params[:invoice_item_id])
  end
end
