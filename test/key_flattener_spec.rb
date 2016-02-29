#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'

require 'minitest/autorun'

require_relative '../src/key_flattener'

class KeyFlattenerTest < Minitest::Test
  def hash
    { 'simple' => { 'one' => 1, 'two' => 2 } }
  end

  def test_found_value?
    assert_equal(
      KeyFlattener.new({ 'one' => 1 } , 'one').found_value?,
      true
    )
  end
end
