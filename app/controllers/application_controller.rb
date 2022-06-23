class ApplicationController < ActionController::Base

  # Navbar
  before_action :set_nav_links
  before_action :set_dropdown

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
end
