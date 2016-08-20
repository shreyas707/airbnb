class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.completed.subject
  #
  def completed(booking, user)
    @booking = booking
    @user = user

    mail to: "#{booking.room.user.email}", subject: "#{booking.room.name} has been booked."
  end
end
