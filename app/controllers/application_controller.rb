class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :base_url, :cashback_contents

  private

  def base_url
    @base_url = request.path #TODO: Need to be changed to request.base_url after getting domains
  end

  def cashback_contents
    if @base_url.include?("/nz")
      @web_url = ENV['CASHBACK_NZ_URL']
      @contact_email = ENV['CASHBACK_NZ_EMAIL']

      @logo = "images/nz-logo.png"
      @logo_class = "nz-logo"
      @phone = "tel:0800669487"
      @phone_display = " 0800 669 487"
      @address = {line_1: "PO 147167", line_2: "Ponsonby, Auckland, 1144", line_3: ""}

    else
      @web_url = ENV['CASHBACK_AU_URL']
      @contact_email = ENV['CASHBACK_AU_EMAIL']

      @logo = "images/au-logo.png"
      @logo_class = "au-logo"
      @phone = "tel:1300669487"
      @phone_display = " 1 300 669 487"
      @address = {line_1: "PO BOX 6331", line_2: "Alexandria, NSW 2015", line_3: "Australia"}
    end
  end
end
