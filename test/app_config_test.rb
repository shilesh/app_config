require 'test_helper'

class AppConstantsTest < ActiveSupport::TestCase

  def test_should_load_config_values
    assert_equal AppConfig::NAME, "TestUser"
  end
  
end
