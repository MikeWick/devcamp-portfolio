module DefaultPageContent
  extend ActiveSupport::Concern

  included do 
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Michael Wickert | Portfolio App"
    @seo_keywords = "Michael Wickert portfolio"
  end
end



