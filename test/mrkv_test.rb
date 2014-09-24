require_relative 'test_helper'

class TestMrkvChain <  Minitest::Test

  def test_it_responds_to_new
    assert Mrkv::Chain.respond_to? :new
  end

end