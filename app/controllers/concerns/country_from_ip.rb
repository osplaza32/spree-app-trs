require 'net/http'
require 'json'

# Country utils from IP
module CountryFromIp
  extend ActiveSupport::Concern

  def request_from_international_customer?
    return false unless Rails.env.production? || Rails.env.staging?
    api_call = URI.parse('http://freegeoip.net/json/' + request.remote_ip)
    data = JSON.parse(Net::HTTP.get_response(api_call).body)
    international_customer_country_code?(data['country_code'])
  rescue
    false
  end

  private

  def international_customer_country_code?(country_code)
    country_code_whitelist = %w[MX BR PE AR]
    country_code_whitelist.include?(country_code.upcase)
  end
end
