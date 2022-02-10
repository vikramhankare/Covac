class User < ApplicationRecord

has_secure_password



# validates :username, presence: true
validates :username, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
validates :password, presence: true
validates :first_name, presence: true
validates :last_name, presence: true
validates :gender, presence: true
validates :vaccine_status, presence: true
validates :aadhaar, presence: true
validates :email_id, presence: true
validates :phone_no, presence: true
validates :address, presence: true
validates :pin_code, presence: true
validates :noofvacc, presence: true
validates :vcount, presence: true

end