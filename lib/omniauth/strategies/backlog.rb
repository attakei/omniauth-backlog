require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Backlog < OmniAuth::Strategies::OAuth2
      option :name, 'backlog'

      option :space_id, nil

      option :authorize_params, {
        response_type: 'code'
      }

      option :client_options, {
        authorize_url: '/OAuth2AccessRequest.action',
        token_url: '/api/v2/oauth2/token',
        proxy: ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil
      }

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, add_dynamic_site(deep_symbolize(options.client_options)))
      end

      def add_dynamic_site(hash)
        unless hash.key?(:site)
          space_id = options.space_id || request_space_id

          raise 'Backlog space is missing.' if space_id.nil?

          hash[:site] = 'https://' + space_id + '.backlog.com'
        end
        hash
      end

      def request_space_id
        space_id = request.session['backlog_space_id'] || request.params['backlog_space_id']
        request.session['backlog_space_id'] = space_id if space_id

        space_id
      end

      # cf: https://qiita.com/kato2222/items/cf70def83129116942be
      def build_access_token
        verifier = request.params['code']
        client.auth_code.get_token(verifier, { redirect_uri: access_token_redirect_url }.merge(token_params.to_hash(:symbolize_keys => true)), deep_symbolize(options.auth_token_params))
      end

      def access_token_redirect_url
        full_host + script_name + callback_path
      end

      uid { raw_info['userId'] }

      info do
        {
          name: raw_info['name'],
          email: raw_info['mailAddress']
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

      protected

      def site
        options.site || validate_site(request.params[options.params.site])
      end

      def validate_site(str)
        if str && str != ''
          uri?(str) ? str : "https://#{str}.backlog.com"
        end
      end
    end
  end
end
