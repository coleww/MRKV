require_relative 'test_helper'

class TestMrkvChain <  Minitest::Test

  def setup
    @chain = Mrkv::Chain.new
    @chain.add ['i like cats', 'I like pizza', 'I   LiKe    pookie']
  end

  def test_it_has_ngram_defaulting_to_two
    assert_equal 2, (Mrkv::Chain.send :ngram)
  end

  def test_it_turns_arrays_of_lines_into_chains
    assert_equal ['i like'], (@chain.send :keys)
  end

  def test_it_generates_stuff_based_on_things_and_dgafs_about_punctuation
    assert_match /i like \w+/, (@chain.generate 'i like')
  end

  def test_it_randoms
    randoms = [0..90].map { |r| @chain.random }
    assert_equal 3, randoms.uniq
  end

end
