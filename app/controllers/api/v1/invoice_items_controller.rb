class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItems.all
  end

  def show
    respond_with InvoiceItems.find_by(id: params[:id])
  end

  def create
    respond_with InvoiceItems.create(invoice_item_params)
  end

  def update
    respond_with InvoiceItems.update(params[:id], invoice_item_params)
  end

  def destroy
    respond_with InvoiceItems.destroy(params[:id])
  end

  def random
    render json: InvoiceItems.all.sample
  end

  def search
    render json: InvoiceItems.find_by(find_params)
  end

  def search_all
    render json: InvoiceItems.where(find_params)
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
    InvoiceItem.find_by(id: params[:invoice_item_id])
  end
end
