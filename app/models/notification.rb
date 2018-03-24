class Notification < ApplicationRecord
  extend Enumerize
  extend ActiveModel::Naming

  before_create :set_cost_and_term

  enumerize :category, in: %w[accident damage fault], i18n_scope: "category"
  
  validates :description, length: { minimum: 100 }
  validates_email_format_of :email
  validates :category, presence: true

  private

    def set_cost_and_term
      case category.text
      when I18n.t('category.accident')
      	self.term = Time.now + 4.hour
      	  if !Time.now.hour.between?(9, 17)
      	    self.cost = 100
      	  else
      	    self.cost = 50
      	  end
      when I18n.t('category.damage')
      	self.term = Time.now + 1.day
        self.cost = 10
      when I18n.t('category.fault')
      	self.term = Time.now + 3.day
        self.cost = 1
      end
    end

end
