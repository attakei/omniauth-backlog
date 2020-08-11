require 'test_helper'

class TestOmniAuthBacklogWithSiteId < StrategyTestCase
  def setup
    super
    @options = {
      space_id: 'testspace'
    }
  end

  def test_site_is_based_from_space_id
    assert_equal 'https://testspace.backlog.com', strategy.client.site
  end

  def test_raise_error_if_it_not_set_site_and_space_id
    assert_raises RuntimeError do
      @options = {}
      strategy.client
    end
  end
end

class TestOmniAuthBacklogWithParams < StrategyTestCase
  def setup
    super
    @request = stub(params: { 'backlog_space_id' => 'testparams' }, session: {})
  end

  def test_site_is_based_from_space_id
    assert_equal 'https://testparams.backlog.com', strategy.client.site
  end

  def test_it_has_the_correct_authorize_url_with_site_from_options
    assert_equal 'https://testparams.backlog.com/OAuth2AccessRequest.action', strategy.client.authorize_url
  end

  def test_it_has_the_correct_token_url_with_site_from_options
    assert_equal 'https://testparams.backlog.com/api/v2/oauth2/token', strategy.client.token_url
  end
end

class TestOmniAuthBacklogWithSessions < StrategyTestCase
  def setup
    super
    @request = stub(session: { 'backlog_space_id' => 'testsession'}, params: {})
  end

  def test_site_is_based_from_space_id
    assert_equal 'https://testsession.backlog.com', strategy.client.site
  end

  def test_it_has_the_correct_authorize_url_with_site_from_options
    assert_equal 'https://testsession.backlog.com/OAuth2AccessRequest.action', strategy.client.authorize_url
  end

  def test_it_has_the_correct_token_url_with_site_from_options
    assert_equal 'https://testsession.backlog.com/api/v2/oauth2/token', strategy.client.token_url
  end
end

class TestOmniAuthBacklogWithSite < StrategyTestCase
  def setup
    super
    @options = {
      client_options: {
        site: 'https://yourspaceid.backlog.jp'
      }
    }
  end

  def test_it_has_the_correct_site_from_options
    assert_equal 'https://yourspaceid.backlog.jp', strategy.client.site
  end

  def test_it_has_the_correct_authorize_url_with_site_from_options
    assert_equal 'https://yourspaceid.backlog.jp/OAuth2AccessRequest.action', strategy.client.authorize_url
  end

  def test_it_has_the_correct_token_url_with_site_from_options
    assert_equal 'https://yourspaceid.backlog.jp/api/v2/oauth2/token', strategy.client.token_url
  end
end
