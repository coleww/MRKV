# mrkv

[![Gem Version](https://badge.fury.io/rb/mrkv.svg)](http://badge.fury.io/rb/mrkv) [![Build Status](https://travis-ci.org/coleww/mrkv.svg?branch=master)](https://travis-ci.org/coleww/mrkv)

### An actual real life demonstration of everything that this gem does:

```
$ gem install mrkv
Successfully installed mrkv-0.1.0
1 gem installed
$ irb
irb(main):001:0> require 'mrkv'
=> true
irb(main):002:0> example = Mrkv::Chain.new(1) # ngram defaults to 2
=> #<Mrkv::Chain:0x007ff024b36638 @ngram=1, @chain={}>
irb(main):003:0> example.add ["Ruby is a language and a sight to behold!", "Ruby is a bottle of beer and a bag of french fries?", "Ruby is joy and friendship and caring!", "Ruby is a product of love and devotion."]
=> true
irb(main):004:0> example.generate
=> "Ruby is a bottle of love and friendship and a bottle of love and a bag of love and a sight to behold!"
irb(main):005:0> example.generate
=> "Ruby is a language and a language and devotion."
irb(main):006:0> # etc.

```

#### slated 4 v0.2.0

bi-directional chain. respond to input. compression/optimization.