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
    let(:payment) { Payment.create!(amount: 70.0, payment_date: Time.now) }

    it 'responds with a 200' do
      get :show, id: payment.id
      expect(response).to have_http_status(:ok)
    end
  end

end
