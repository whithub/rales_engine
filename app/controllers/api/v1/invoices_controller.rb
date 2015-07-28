class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def create
    respond_with Invoice.create(invoice_params)
  end

  def update
    respond_with Invoice.update(params[:id], invoice_params)
  end

  def destroy
    respond_with Invoice.destroy(params[:id])
  end

  def random
    render json: Invoice.all.sample
  end

  def search
    render json: Invoice.find_by(find_params)
  end

  def search_all
    render json: Invoice.where(find_params)
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
