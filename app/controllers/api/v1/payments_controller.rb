class Api::V1::PaymentsController < ApplicationController

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
    params.require(:payment).permit(:payment_amount_cannot_exceed_loan_amount,
                                    :amount,
                                    :payment_date,
                                    :loan_id)
  end


