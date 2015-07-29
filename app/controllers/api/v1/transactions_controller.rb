class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def create
    respond_with Transaction.create(transaction_params)
  end

  def update
    respond_with Transaction.update(params[:id], transaction_params)
  end

  def destroy
    respond_with Transaction.destroy(params[:id])
  end

  def random
    render json: Transaction.all.sample
  end

  def find
    render json: Transaction.find_by(find_params)
  end

  def find_all
    render json: Transaction.where(find_params)
  end

  def invoice
    render json: find_transaction.invoice
  end

  private

  def transaction_params
    params.require(:transaction).permit(:credit_card_number,
                                        :credit_card_expiration_date,
                                        :result, :invoice_id
    )
  end

  def find_params
    params.permit(:id, :credit_card_number,
                  :credit_card_expiration_date,
                  :result, :invoice_id,
                  :created_at, :updated_at
    )
  end

  def find_transaction
    Transaction.find_by(id: params[:transaction_id])
  end
end
