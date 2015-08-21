require 'bundler/setup'
require 'minitest/autorun'
require 'mocha/setup'
require 'rack/test'
require 'webmock/minitest'
require 'omniauth-backlog'
require 'omniauth/strategies/backlog'


class StrategyTestCase < Minitest::Test
  def setup
    @client_id = 'test'
    @client_secret = 'test'
  end

  def strategy
    @strategy ||= begin
      args = [@client_id, @client_secret, @options].compact
      OmniAuth::Strategies::Backlog.new(nil, *args).tap do |strategy|
        strategy.stubs(:request).returns(@request)
      end
    end
  end
end
