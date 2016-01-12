require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) {
    Loan.create(funded_amount: 100.99)
  }

  context "without funded_amount" do
    it "is invalid without a funded_amount" do
      loan = Loan.new
      expect(loan).to_not be_valid
    end
  end

end
