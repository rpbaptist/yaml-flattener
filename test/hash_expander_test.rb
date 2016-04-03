#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../src/hash_expander'

class HashExpanderTest < Minitest::Test
  def test_single_key
    key_expander = HashExpander.new(hash: { 'one' => 1 })
    assert_equal(
      { 'one' => 1 },
      key_expander.keys_and_values
    )
  end

  def test_unaltered_nested_key
    key_expander = HashExpander.new(hash: { 'test' => { 'one' => 1 } })
    assert_equal(
      { 'test' =>  { 'one' => 1 } },
      key_expander.keys_and_values
    )
  end

  def test_nested_key_expansion
    key_expander = HashExpander.new(hash: { 'test.one' => 1 })
    assert_equal(
      { 'test' =>  { 'one' => 1 } },
      key_expander.keys_and_values
    )
  end
end
