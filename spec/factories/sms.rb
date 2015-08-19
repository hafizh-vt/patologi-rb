FactoryGirl.define do
  factory :sms_true, class: Sms do
    phone_number '08123456789'
    message 'dummy message'
    order_id 123
    status true
	end
end