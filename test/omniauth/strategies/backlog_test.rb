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

end
