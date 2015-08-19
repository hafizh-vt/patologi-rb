class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :order_id
      t.text :message
      t.boolean :status
      t.string :phone_number

      t.timestamps
    end
  end
end
