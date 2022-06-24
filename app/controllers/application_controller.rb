class ApplicationController < ActionController::Base

  # Navbar
  before_action :set_nav_links
  before_action :set_dropdown
  # Notification
  before_action :set_notifications, if: :current_user

  private 
  # Navbar
  def set_nav_links
    @nav_links = [
      { :label => 'Home', :path => root_path }, 
      { :label => 'Blog', :path => posts_path }, 
      { :label => 'About', :path => root_path },
    ]
  end

  def set_dropdown
    @dropdown_label = 'More'
    @dropdown_links = ['action', 'action', 'action']
  end

  # Notification
  def set_notifications
    notifications = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
  end
end
