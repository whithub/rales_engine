class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices

  def search
    @customers = Customer.all
    @customers = @customers.by_first_name(params[:first_name]) if params[:first_name].present?
    @customers = @customers.by_last_name( params[:last_name])  if params[:last_name].present?

    @customers

    # ----------------
    # scoped = Customer.all
    #
    # if params.has_key?(:first_name)
    #   scoped = scoped.where(first_name: params[:first_name])
    # end
    #
    # if params.has_key?(:last_name)
    #   scoped = scoped.where(last_name: params[:last_name])
    # end
    #
    # @customers = scoped.all
    # -----------------

    # Customer.find_by(id: params[:id], first_name: params[:first_name], last_name: params[:last_name])
    # -----------------
    # customer_params.each do |attribute|
    #   customers.find_by(attribute: params[attribute]) if params[attribute].present?
    # end

  end
end
