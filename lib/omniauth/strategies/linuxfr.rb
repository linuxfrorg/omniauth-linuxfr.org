require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class LinuxFr < OmniAuth::Strategies::OAuth2
      BASE_URL = "https://linuxfr.org"

      option :name, :linuxfr

      option :client_options, {
        :site          => "https://linuxfr.org",
        :authorize_url => "/api/oauth/authorize",
        :token_url     => "/api/oauth/token"
      }

      uid { raw_info["login"] }

      info { raw_info }

      def raw_info
        @raw_info ||= access_token.get("/api/v1/me").parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "linuxfr", "LinuxFr"
