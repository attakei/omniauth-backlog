require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Backlog < OmniAuth::Strategies::OAuth
      option :name, 'backlog'
    end
  end
end