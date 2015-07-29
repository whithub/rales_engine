class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def create
    respond_with Merchant.create(merchant_params)
  end

  def update
    respond_with Merchant.update(params[:id], merchant_params)
  end

  def destroy
    respond_with Merchant.destroy(params[:id])
  end

  def random
    render json: Merchant.all.sample
  end

  def search
    render json: Merchant.find_by(find_params)
  end

  def search_all
    render json: Merchant.where(find_params)
  end

  def items
    respond_with find_merchant
  end

  def invoices
    render json: find_merchant.invoices
  end

  def revenue
    render json: find_merchant.revenue(params)
  end

  def most_revenue
    render json: Merchant.most_revenue(params[:quantity].to_i)
  end

  def fav_customer
    render json: find_merchant.fav_customer
  end

  def customers_with_pending_invoices
    render json: find_merchant.customers_with_pending_invoices
  end


  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

  def find_merchant
    Merchant.find_by(id: params[:id])
  end

end
