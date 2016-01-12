class PaymentValidator < ActiveModel::Validator

  def vadliate(payment)
    unless payment.amount.is_less_than_loan_amount?
  end

end