class Notification < ApplicationRecord
  before_create :set_cost_and_term

  enum category: [:accident, :damage, :fault]

  validates :description, length: { minimum: 100 }
  validates_email_format_of :email, :message => 'It is not looking good'
  validates :category, presence: true

  private

    def set_cost_and_term
      case category
      when 'accident'
      	self.term = Time.now + 4.hour
      	  if !Time.now.hour.between?(9, 17)
      	    self.cost = 100
      	  else
      	    self.cost = 50
      	  end
      when 'damage'
      	self.term = Time.now + 1.day
        self.cost = 10
      when 'fault'
      	self.term = Time.now + 3.day
        self.cost = 1
      end
    end

end
