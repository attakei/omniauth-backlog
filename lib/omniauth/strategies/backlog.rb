require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Backlog < OmniAuth::Strategies::OAuth
      option :name, 'backlog'

      option :space, nil

      args [:space, :consumer_key, :consumer_secret]
    end
  end
end