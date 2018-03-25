class ReadNotificationsService

  def self.valid_keys(options)
    expected_keys_string = ["email", "category", "cost"]
    expected_keys_symbol = [:email, :category, :cost]
    if (options.keys - expected_keys_string).empty? or (options.keys - expected_keys_symbol).empty?
      return true
    end
  end

  public

  def self.read(x, options = { } ) 
    if valid_keys(options)
      @notifications = Notification.where(read: false).where(options).first(x)
      puts @notifications.to_s
      @notifications.map{ |notification| notification.update_attributes( { read: true } ) } 
    else
      puts "Wrong options"     
    end 
  end

end