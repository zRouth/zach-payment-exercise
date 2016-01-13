class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :amount,
            :payment_date,
            :loan_id, presence: true

  validate :payment_amount_cannot_exceed_loan_amount

  def payment_amount_cannot_exceed_loan_amount
    self.loan ? validate_amount : true
  end

  def validate_amount
    if amount > self.loan.funded_amount
      errors.add(:amount, "cannot be greater than your funded amount")
    end
  end

end
