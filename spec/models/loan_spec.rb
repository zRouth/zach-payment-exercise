require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) {
    Loan.create(funded_amount: 100.99)
  }

  let(:payment) {
    Payment.create(amount: 80.90, payment_date: Time.now, loan_id: loan.id)
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
  end

end
