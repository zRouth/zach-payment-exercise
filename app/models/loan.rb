class Loan < ActiveRecord::Base
  has_many :payments

  validates :funded_amount, presence: true

  def calculate_outstanding_balance
    funded_amount - total_payments
  end

  def total_payments
    payments.sum(:amount)
  end
end




