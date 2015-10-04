require 'test_helper'

module GrapeCli
  class Test < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::GrapeCli::VERSION
    end
  end
end
