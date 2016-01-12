require 'rails_helper'

RSpec.describe Api::V1::PaymentsController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'responds with json' do
      get :index, format: :json

      expect(response).to be_success
    end
  end

  describe '#show' do
    let(:loan) { Loan.create(funded_amount: 200.00)}
    let(:payment) { Payment.create(amount: 70.00, payment_date: Time.now, loan_id: 1) }

    it 'responds with a 200' do
      get :show, id: payment.id
      expect(response).to have_http_status(:ok)
    end
  end

end
