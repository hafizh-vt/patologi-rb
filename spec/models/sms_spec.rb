require 'rails_helper'

describe Sms do
  it 'is invalid without a recipient (phone number)' do
    sms = Sms.new
    sms.message = 'dummy message'
    expect(sms).to_not be_valid
  end

  it 'is invalid without message' do
    sms = Sms.new
    sms.phone_number = '081234567890'
    expect(sms).to_not be_valid
  end
end
