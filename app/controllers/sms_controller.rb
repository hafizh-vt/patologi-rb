class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @sms = Sms.all
  end

  def create
    expect_success = params[:expect_success].to_b
    Sms.create message: params[:message], order_id: params[:order_id], phone_number: params[:phone_number], status: expect_success
    resp = { status: expect_success ? 'OK' : 'Not OK' }
    (resp['reason'] = 'Return failed as requested') unless expect_success
    render json: resp.to_json, status: expect_success ? 200 : 500, layout: false
  end

  def destroy_all
    Sms.destroy_all
    respond_to do |format|
      format.html { redirect_to action: :index }
      format.json { render json: {status: 'OK'} }
    end
  end

end
