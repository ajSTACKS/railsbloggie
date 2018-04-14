module SetPageTitle
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "AJ | Web Developer"
    @seo_keywords = " web developer"
  end

end
