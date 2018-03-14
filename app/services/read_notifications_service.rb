class ReadNotificationsService

  public

  def self.read(x,hash = { })  
    @notifications = Notification.where(read: false).where(hash).first(x)
    puts @notifications.to_s
    @notifications.map{ |notification| notification.update_attributes( { read: true } ) }   
  end

end