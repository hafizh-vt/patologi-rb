require 'rails_helper'

describe 'sms/index.html.erb' do
  it 'display correct sms content' do
    assign(:sms, [Sms.create(phone_number: '08123456789', message: 'dummy message', order_id: 123)])
    render
    expect(rendered).to match(/08123456789/)
    expect(rendered).to match(/dummy message/)
    expect(rendered).to match(/123/)
  end

  it 'display correct number of sms in list' do
    sms = Sms.create(phone_number: '08123456789', message: 'dummy message', order_id: 123)
    assign(:sms, [sms, sms, sms])
    render
    expect(rendered).to have_selector('tbody tr', count:3)
  end
end