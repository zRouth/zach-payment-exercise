class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :payment_amount_cannot_exceed_loan_amount,
            :amount,
            :payment_date,
            :loan_id, presence: true

  def payment_amount_cannot_exceed_loan_amount
    if self.loan
      validate_amount
    else
      true
    end
  end

  def validate_amount
    if amount > self.loan.funded_amount
      errors.add(:amount, "cannot be greater than your funded amount")
    end
  end

end
