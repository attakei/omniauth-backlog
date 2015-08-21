require 'test_helper'

class TestOmniAuthBacklog < StrategyTestCase

  def test_it_has_the_correct_site
    @options = {
        :client_options => {
            :site => 'https://yourspaceid.backlog.jp'
        }
    }
    assert_equal 'https://yourspaceid.backlog.jp', strategy.client.site
  end

  def test_it_has_the_correct_authorize_url
    @options = {
        :client_options => {
            :site => 'https://yourspaceid.backlog.jp'
        }
    }
    assert_equal 'https://yourspaceid.backlog.jp/OAuth2AccessRequest.action', strategy.client.authorize_url
  end

  def test_it_has_the_correct_token_url
    @options = {
        :client_options => {
            :site => 'https://yourspaceid.backlog.jp'
        }
    }
    assert_equal 'https://yourspaceid.backlog.jp/api/v2/oauth2/token', strategy.client.token_url
  end

end
