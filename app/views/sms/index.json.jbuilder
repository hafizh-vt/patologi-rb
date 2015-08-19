json.array! @sms do |sms|
	json.to sms.phone_number
	json.message sms.message
	json.order_id sms.order_id
	json.delivery_time sms.created_at
	json.delivery_status sms.status ? 'Success' : 'Failed'
end
