require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class LinuxFr < OmniAuth::Strategies::OAuth2
      BASE_URL = "https://linuxfr.org"

      option :client_options, {
        :site          =>    BASE_URL,
        :authorize_url => "#{BASE_URL}/login/oauth/authorize",
        :token_url     => "#{BASE_URL}/login/oauth/access_token"
      }

      def request_phase
        super
      end

      uid { raw_info["login"] }

      info do
        {
          "login" => raw_info["login"],
          "email" => raw_info["email"],
          "name"  => raw_info["name"]
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get("/user").parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "linuxfr", "LinuxFr"
