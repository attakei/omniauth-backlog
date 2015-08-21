require 'test_helper'

class TestOmniAuthBacklog < StrategyTestCase

  def test_site_is_based_from_space_id
    @options = {
        :site_id => 'yourspaceid'
    }
    assert_equal 'https://yourspaceid.backlog.jp', strategy.client.site
  end

  def test_it_has_the_correct_site_from_options
    @options = {
        :client_options => {
            :site => 'https://yourspaceid.backlog.jp'
        }
    }
    assert_equal 'https://yourspaceid.backlog.jp', strategy.client.site
  end

  def test_it_has_the_correct_authorize_url_with_site_from_options
    @options = {
        :client_options => {
            :site => 'https://yourspaceid.backlog.jp'
        }
    }
    assert_equal 'https://yourspaceid.backlog.jp/OAuth2AccessRequest.action', strategy.client.authorize_url
  end

  def test_it_has_the_correct_token_url_with_site_from_options
    @options = {
        :client_options => {
            :site => 'https://yourspaceid.backlog.jp'
        }
    }
    assert_equal 'https://yourspaceid.backlog.jp/api/v2/oauth2/token', strategy.client.token_url
  end

end
