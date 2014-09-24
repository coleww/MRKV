require_relative 'test_helper'

class TestMrkvChain <  Minitest::Test

  def setup
    @chain = Mrkv::Chain.new(2)
    @chain.add ['i like cats; and "i dislike" bad people.',
                "I like: 'pizza bagels?'",
                'I   LiKe,    pookie and ice cream too!']
  end

  def test_it_generates_capitalized_sentences
    assert_match /^I like \w+/, (@chain.generate)
  end

  def test_it_generates_end_punctuated_sentences
    assert_match /(\.|\?|\!)$/, (@chain.generate)
  end

end
