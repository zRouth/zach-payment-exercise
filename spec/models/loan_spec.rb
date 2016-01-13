require 'rails_helper'

RSpec.describe Loan, type: :model do
  attr_reader :loan, :payment

  before(:each) {
    @loan = Loan.create(funded_amount: 100.99)
    @payment = Payment.create(amount: 80.90, payment_date: Time.now, loan_id: loan.id)
  }

  context "without funded_amount" do
    it "is invalid without a funded_amount" do
      loan = Loan.new
      expect(loan).to_not be_valid
    end
  end

  context "with funded_amount" do
    it "is valid" do
      expect(loan).to be_valid
    end

    it "can calculate the total payments" do
      expect(loan.total_payments(loan.id)).to eq(80.90.to_d)
    end

    it "can calculate the outstanding balance" do
      expect(loan.calculate_outstanding_balance(loan.id)).to eq(20.09)
    end

    it "can calculate the outstanding balance of 2 payments" do
      payment2 = Payment.create(amount: 10.00, payment_date: Time.now, loan_id: loan.id)
      payment2
      expect(loan.calculate_outstanding_balance(loan.id)).to eq(10.09)
    end
  end

end
