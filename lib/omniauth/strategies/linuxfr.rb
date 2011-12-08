require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class LinuxFr < OmniAuth::Strategies::OAuth2
      BASE_URL = "https://linuxfr.org"

      option :client_options, {
        :site          =>    BASE_URL,
        :authorize_url => "#{BASE_URL}/auth/oauth/authorize",
        :token_url     => "#{BASE_URL}/auth/oauth/access_token"
      }

      def request_phase
        super
      end

      uid { raw_info["login"] }

      info { raw_info }

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get("/auth/oauth/user").parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "linuxfr", "LinuxFr"
