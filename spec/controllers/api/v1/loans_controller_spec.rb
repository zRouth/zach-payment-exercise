require 'rails_helper'

RSpec.describe Api::V1::LoansController, type: :controller do
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
    let(:loan) { Loan.create!(funded_amount: 100.0) }


    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, id: 10000
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'if the loan is found' do
      it 'responds with a 200' do
        get :show, id: loan.id
        expect(response).to have_http_status(:ok)
      end

      it 'exposes the outstanding balance' do
        get :show, id: loan.id

        body = JSON.parse(response.body)
        expect(body.keys.include?("outstanding_balance")).to be true
      end

      it 'exposes and calculates outstanding balance correctly for payment' do
        get :show, id: loan.id

        body = JSON.parse(response.body)
        expect(body.keys.include?("outstanding_balance")).to be true

        loan.payments.create(amount: 20.00, payment_date: Time.now)

        get :show, id: loan.id

        body = JSON.parse(response.body)
        expect(body["outstanding_balance"]).to eq("80.0")
      end

      it 'exposes and calculates outstanding balance correctly for multiple payments' do
        get :show, id: loan.id

        body = JSON.parse(response.body)
        expect(body.keys.include?("outstanding_balance")).to be true

        loan.payments.create(amount: 20.00, payment_date: Time.now)
        loan.payments.create(amount: 20.00, payment_date: Time.now)

        get :show, id: loan.id

        body = JSON.parse(response.body)
        expect(body["outstanding_balance"]).to eq("60.0")
      end
    end
  end

end
