class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :cashback_contents

  private
  def cashback_contents
    if request.path.include?("nz") # change to request.base_url.include later
      @home_page = nz_path # change to real NZ website
      @logo = "images/nz-logo.png"
      @logo_class = "nz-logo"
      @phone = "tel:0800669487"
      @phone_display = " 0800 669 487"
      @address = {line_1: "PO 147167", line_2: "Ponsonby, Auckland, 1144", line_3: ""}
    else
      @home_page = au_path # change to real AU website
      @logo = "images/au-logo.png"
      @logo_class = "au-logo"
      @phone = "tel:1300669487"
      @phone_display = " 1 300 669 487"
      @address = {line_1: "PO BOX 6331", line_2: "Alexandria, NSW 2015", line_3: "Australia"}
    end

  end
end
