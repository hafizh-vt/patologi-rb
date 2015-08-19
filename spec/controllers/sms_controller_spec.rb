require 'rails_helper'

describe SmsController do
  describe 'GET #index' do
    it 'assigns @sms' do
      get :index
      expect(assigns(:sms)).to_not be_nil
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do

    it 'saves new sms to database' do
      params = {phone_number: '08123456789', message: 'dummy message', order_id: '123', expect_success: true}
      expect{post :create, params}.to change(Sms, :count).by(1)
    end

    describe 'returns appropriate status according to expect_success' do
      context 'expect_success == true' do
        it 'returns status ok' do
          params = {phone_number: '08123456789', message: 'dummy message', order_id: '123', expect_success: true}
          post :create, params
          response_json = JSON.parse(response.body)
          expect(response_json['status']).to eq('OK')
        end
      end

      context 'expect_success == false' do
        it 'returns status not ok' do
          params = {phone_number: '08123456789', message: 'dummy message', order_id: '123', expect_success: false}
          post :create, params
          response_json = JSON.parse(response.body)
          expect(response_json['status']).to eq('Not OK')
        end
      end
    end
  end

  describe 'DELETE #destroy_all' do
    it 'deletes all sms in database' do
      delete :destroy_all
      expect(Sms.count).to eq(0)
    end

    context 'respond_to html' do
      it 'redirects to #index' do
        delete :destroy_all
        expect(response).to redirect_to sms_path
      end
    end

    context 'respond_to json' do
      it 'return status OK' do
        request.env["HTTP_ACCEPT"] = 'application/json'
        delete :destroy_all
        json_response = JSON.parse(response.body)
        expect(json_response['status']).to eq('OK')
      end
    end
  end
end
