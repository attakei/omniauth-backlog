require 'omniauth-oauth'
require 'cgi'


module OmniAuth
  module Strategies
    class Backlog < OmniAuth::Strategies::OAuth
      args [:space, :consumer_key, :consumer_secret]

      option :name, 'backlog'

      option :space, nil

      option :authorize_params, {
        :response_type => 'code',

      }

      def site_domain
        options.space + '.backlog.jp'
      end

      def request_phase
        endpoint_url = '/OAuth2AccessRequest.action'
        query_hash = {:redirect_url => callback_url, :client_id => options.consumer_key}.merge(options.authorize_params)
        query_string = (query_hash||{}).map{|k,v|
          CGI::escape(k.to_s) + "=" + CGI::escape(v.to_s)
        }.join("&")
        redirect 'https://' + site_domain + endpoint_url + '?' + query_string
      end
    end
  end
end