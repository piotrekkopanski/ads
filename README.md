1 To prepare the database
- in Your terminal: git clone https://github.com/piotrekkopanski/ads.git
- bundle install
- rake db:migrate
- rails s
- go to http: // localhost: 3000
- fill in the description field, which must contain at least 100 characters
- select one of the three categories (failure, damage, malfunction)
- enter the correct email address
- and click the button " Create Notification "
if you want to add a new notification click the" New Notification " link

2 Url form is http: // localhost: 3000 or http: // localhost: 3000 / notifications / new

3 The application has a service to read notifications: ReadNotificationsService