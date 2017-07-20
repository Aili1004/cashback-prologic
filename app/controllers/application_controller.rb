class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :cashback_contents

  private
  def cashback_contents
    if request.path.include?("nz") # change to request.base_url.include later
      @logo = "images/nz-logo.png"
      @logo_class = "nz-logo"
      @footer_logo = "images/nz-logo.png"
    else
      @logo = "images/au-logo.png"
      @logo_class = "au-logo"
      @footer_logo = "images/au-logo.png"
    end

  end
end
