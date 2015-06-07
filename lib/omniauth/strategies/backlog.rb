require 'omniauth-oauth2'


module OmniAuth
  module Strategies
    class Backlog < OmniAuth::Strategies::OAuth2
      args [:client_id, :client_secret]

      option :name, 'backlog'

      option :space, nil

      option :authorize_params, {
        :response_type => 'code',

      }
      option :client_options, {
        :authorize_url => '/OAuth2AccessRequest.action',
        :token_url => '/api/v2/oauth2/token',
        :proxy => ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil
      }

      uid{ raw_info['userId'] }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['mailAddress']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v2/users/myself').parsed
      end
    end
  end
end