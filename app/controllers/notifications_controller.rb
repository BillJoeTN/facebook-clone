class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.unread
  end

  def update
    @notification = current_user.notifications.find(params[:id])
    @notification.update(read: true)
    redirect_to notifications_path
  end
end
