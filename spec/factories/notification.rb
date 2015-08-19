FactoryGirl.define do
  factory :notification, class: Notification do
    message {{
        status_code: "201",
        status_message: "Veritrans payment notification",
        transaction_id: "8b1b6e28-e501-425e-b925-49e4671ee9a6",
        order_id: "3cdb748e64f5c",
        payment_type: "echannel",
        transaction_time: "2015-08-13 10:54:21",
        transaction_status: "pending",
        signature_key: "aa37009464a47c9413390cf99334db02adcd5caf9efc5cc1cc1fc2e40ccf3edcf4dd44b5c2566b61e4fecc7e052969b4047d279f119a1d4aca5fdba1cd822f8a",
        custom_field1: "Special Deal",
        custom_field2: "Branch 2",
        bill_key: "000540",
        gross_amount: "6000.00"
      }.to_json}
    order_id '3cdb748e64f5c'
    flag true
    status_code 201
  end
end