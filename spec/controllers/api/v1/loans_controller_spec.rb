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

        # binding.pry
        body = JSON.parse(response.body)
        raise body.keys.include?("outstanding_balance").inspect
        expect(body.keys.include?("outstanding_balance")).to be true
      end
    end
  end

end
