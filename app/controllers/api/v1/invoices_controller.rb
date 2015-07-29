class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def random
    render json: Invoice.all.sample
  end

  def find
    render json: Invoice.find_by(find_params)
  end

  def find_all
    render json: Invoice.where(find_params)
  end

  def customer
    render json: find_invoice.customer
  end

  def merchant
    render json: find_invoice.merchant
  end

  def items
    render json: find_invoice.items
  end

  def invoice_items
    render json: find_invoice.invoice_items
  end

  def transactions
    render json: find_invoice.transactions
  end

  private

  def invoice_params
    params.require(:invoice).permit(:status, :customer_id, :merchant_id)
  end

  def find_params
    params.permit(:id, :status, :customer_id, :merchant_id, :created_at, :updated_at)
  end

  def find_invoice
    Invoice.find_by(id: params[:invoice_id])
  end
end
