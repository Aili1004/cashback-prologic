class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :get_contents
  layout :set_layout

  private

  def set_layout
    if is_matching_url(ENV['PROLOGIC_URL'], "prologic")
      "layouts/pro_logic"
    else
      "layouts/cashbacks"
    end
  end

  def get_contents
    @is_au_site = true
    if is_matching_url(ENV['CASHBACK_NZ_URL'], "mycashback")
      @is_au_site = false

      @site_name = ENV['CASHBACK_NZ_SITE']
      @contact_email = ENV['CASHBACK_NZ_EMAIL']

      @logo = "cashbacks/images/nz-logo.png"
      @logo_class = "nz-logo"
      @phone = "tel:0800669487"
      @phone_display = " 0800 669 487"
      @address = {line_1: "PO Box 147167", line_2: "Ponsonby", line_3: "Auckland, 1144"}

      @facebook_url = "https://www.facebook.com/Mycashbackconz-822899344511890/"
      @twitter_url = "https://twitter.com/MyCashBackconz"
      @linkedin_url = "https://www.linkedin.com/company-beta/18047407/"

    else
      @site_name = ENV['CASHBACK_AU_SITE']
      @contact_email = ENV['CASHBACK_AU_EMAIL']

      @logo = "cashbacks/images/au-logo.png"
      @logo_class = "au-logo"
      @phone = "tel:1300669487"
      @phone_display = " 1 300 669 487"
      @address = {line_1: "PO BOX 6331", line_2: "Alexandria, NSW 2015", line_3: "Australia"}

      @facebook_url = "https://www.facebook.com/CashBackcomau-441603355903263/"
      @twitter_url = "https://twitter.com/CashBackcomau"
      @linkedin_url = "https://www.linkedin.com/company-beta/3007416/"
    end
  end

  def is_matching_url url, site
    request.original_url.include?(url) || request.query_parameters['site'] === site
  end
end
