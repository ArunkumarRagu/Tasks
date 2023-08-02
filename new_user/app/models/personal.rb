class Personal < ApplicationRecord
    # validates :username, presence: { message: 'Name cannot be blank.' }, uniqueness: { message: 'Name must be unique.' }
    # validates :phone, format: { with: /\A\+\d{2} \d{4} \d{3} \(\d{3}\)\z/, message: 'Contact number should match +dd dddd ddd (ddd)' }
    # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
