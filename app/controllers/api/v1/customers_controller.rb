class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml
  # scope :by_first_name, lambda { |first_name| where(first_name: first_name)}
  # scope :by_last_name, lambda  { |last_name|  where(last_name:  last_name)}

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def random
    render json: Customer.all.sample
    # respond_with Customer.all.sample
  end

  def find
    render json: Customer.find_by(find_params)
  end

  def find_all
    render json: Customer.where(find_params)
  end

  def invoices
    render json: find_customer.invoices
  end

  def transactions
    render json: find_customer.transactions
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

  def find_customer
    Customer.find_by(id: params[:customer_id])
  end

end
