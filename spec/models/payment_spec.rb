require 'rails_helper'

RSpec.describe Payment, type: :model do

  context "without valid attributes" do
    it "is invalid without an amount" do
      payment = Payment.new
      expect(payment).to_not be_valid
    end

    it "is invalid with a payment amount greater than the funded amount" do
      loan = Loan.create(funded_amount: 100.00)
      payment = loan.payments.build(amount: 101.97, payment_date: Time.now)
      expect(payment).to be_invalid
    end

    it "is invalid with a payment amount greater than the oustanding balance" do
      loan = Loan.create(funded_amount: 100.00)
      payment = loan.payments.create(amount: 60.00, payment_date: Time.now)
      loan.calculate_outstanding_balance

      payment2 = loan.payments.create(amount: 50.00, payment_date: Time.now)

      expect(payment).to be_invalid
    end
  end

end
