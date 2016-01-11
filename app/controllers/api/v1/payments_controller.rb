class Api::V1::PaymentsController < ApplicationController
  responds_to :json

  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    render json: Payment.create(payment_params)
  end

end

private

  def payment_params
    params.require(:payment).permit(:amount, :payment_date, :loan_id)
  end


