class Sms < ActiveRecord::Base
  validates :phone_number, presence: true
  validates :message, presence: true
end
