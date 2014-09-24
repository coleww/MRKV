require_relative 'test_helper'

class TestMrkvChain <  Minitest::Test

  def setup
    @chain = Mrkv::Chain.new
    @chain.add ['i like cats', 'I like pizza', 'I   LiKe    pookie']
  end

  def test_it_has_ngram_defaulting_to_two
    assert_equal 2, (@chain.send :ngram)
  end

  def test_it_turns_arrays_of_lines_into_chains
    assert_equal ['i like'], (@chain.send :keys)
  end

  def test_it_generates_stuff_based_on_things_and_dgafs_about_punctuation
    assert_match /i like \w+/, (@chain.generate 'i like')
  end

  def test_it_finds_random_keys
    randoms = [*0..90].map { |r| @chain.generate 'i like' }
    assert_equal 3, randoms.uniq.length
  end

end
