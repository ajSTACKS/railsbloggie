class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern


before_action :set_page_defaults

  def set_page_defaults
    @page_title = "AJ | Web Developer"
    @seo_keywords = "blah"
  end
end
