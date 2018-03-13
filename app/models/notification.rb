class Notification < ApplicationRecord
  before_create :set_cost_and_term

  validates :description, length: { minimum: 100 }
  validates_email_format_of :email, :message => 'It is not looking good'
  validates :category, presence: true

  private

    def set_cost_and_term
      if category == 'awaria'
      	self.term = Time.now + 4.hour
        if !Time.now.hour.between?(9, 17)
      	  self.cost = 100
      	else
      	  self.cost = 50
      	end
      elsif category == 'uszkodzenie'
        self.term = Time.now + 1.day
        self.cost = 10	  
      elsif category == 'usterka'
        self.term = Time.now + 3.day
        self.cost = 1
      end	
    end

end
