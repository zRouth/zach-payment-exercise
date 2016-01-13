class Loan < ActiveRecord::Base
  has_many :payments

  validates :funded_amount, presence: true

  def calculate_outstanding_balance(loan_id)
    funded_amount - total_payments(loan_id)
  end

  def total_payments(loan_id)
    Payment.where(loan_id: loan_id).sum(:amount)
  end
end




