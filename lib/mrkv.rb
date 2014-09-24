require "mrkv/version"

module Mrkv
  class Chain
    def initialize ngram=2
      @ngram = ngram
      @chain = Hash.new { |h,k| h[k] = [] }
    end

    def add lines
      lines.each do |line|
        line.downcase.capitalize.gsub(/[^a-zA-Z0-9\.\!\?\s]/, '').split.each_cons(@ngram + 1) do |link|
          next if link.nil?
          @chain[link.take(@ngram).join(" ")] << link.last
        end
      end
      @starters = @chain.keys.select{|k| k =~ /^[A-Z]/}
    end

    def generate
      random_starter.split.tap do |str_arr|
        until str_arr.last.match /[\?\!\.]$/
          possibilities = @chain[str_arr[-@ngram..-1].join(" ")]
          if !possibilities.empty?
            str_arr << possibilities.sample
          else
            str_arr.last << ["?", "!", "."].sample
          end
        end
      end.join(" ")
    end

  private

    def random_starter
      @starters.sample
    end
  end
end
