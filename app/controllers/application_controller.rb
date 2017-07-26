class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :cashback_contents

  private

  def cashback_contents
    @original_url = request.original_url
    @is_au_site = true

    if @original_url.include?(ENV['CASHBACK_NZ_URL']) || request.query_parameters['site'] === "mycashback"
      @is_au_site = false

      @web_url = ENV['CASHBACK_NZ_URL']
      @site_name = ENV['CASHBACK_NZ_SITE']
      @contact_email = ENV['CASHBACK_NZ_EMAIL']

      @logo = "images/nz-logo.png"
      @logo_class = "nz-logo"
      @phone = "tel:0800669487"
      @phone_display = " 0800 669 487"
      @address = {line_1: "PO 147167", line_2: "Ponsonby, Auckland, 1144", line_3: ""}

    else
      @web_url = ENV['CASHBACK_AU_URL']
      @site_name = ENV['CASHBACK_AU_SITE']
      @contact_email = ENV['CASHBACK_AU_EMAIL']

      @logo = "images/au-logo.png"
      @logo_class = "au-logo"
      @phone = "tel:1300669487"
      @phone_display = " 1 300 669 487"
      @address = {line_1: "PO BOX 6331", line_2: "Alexandria, NSW 2015", line_3: "Australia"}
    end
  end
end
