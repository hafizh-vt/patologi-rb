FactoryGirl.define do
	factory :setting_true, class: Setting do
    key 'notification_status'
    value 'true'
	end	
end