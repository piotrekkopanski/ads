class Notification < ApplicationRecord
  validates :description, length: { minimum: 100 }
  validates_email_format_of :email, :message => 'It is not looking good'
  validates :category, presence: true
end
