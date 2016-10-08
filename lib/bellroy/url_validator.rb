require 'addressable/uri'

module Bellroy
  module UrlValidator
    class InvalidUrl < StandardError; end

    VALID_HOSTS = [
                    "www.bellroy.com",
                  ]

    def self.validate(url = "")
      target = Addressable::URI.heuristic_parse(url)
      target.path = "/#{target.path}" unless target.path[0] == '/'
      target.host = whitelisted_hosts(target.host) || ENV['APP_HOST'] || 'www.bellroy.com'
      target.scheme = ENV['APP_SCHEME'] || ((target.scheme == 'http' || target.scheme == 'https') ? target.scheme : 'http')
      target.port = target.scheme == 'https' ? 443 : 80
      target.to_s
    rescue => e
      Airbrake.notify(e) if defined?(Airbrake)
      raise InvalidUrl
    end

    private

    def self.whitelisted_hosts(url)
      url if VALID_HOSTS.include?(url)
    end
  end
end
