require "mrkv/version"

module Mrkv
  class Chain
    def initialize ngram=2
      @ngram = ngram
      @chain = Hash.new { |h,k| h[k] = [] }
    end

    def add lines
      lines.each do |line|
        line.split(" ").each_cons(ngram + 1) do |link|
          next if link.nil?
          @chain[link.take(ngram).join(" ").downcase] << link.last
        end
      end
    end

    def random_key
      @chain.keys.sample
    end

    def generate key
      key + " " + @chain[key].sample
    end

  private

    def ngram
      @ngram
    end

    def keys
      @chain.keys
    end
  end
end
