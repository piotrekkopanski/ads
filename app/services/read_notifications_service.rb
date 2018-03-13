class ReadNotificationsService

  public

  def self.read(x,hash = { })
    @notifications = Notification.where(read: false).where(hash).first(x)
    @notifications.map{ |notification| notification.update_attributes( { read: true } ) }   
    return @notifications
  end

end