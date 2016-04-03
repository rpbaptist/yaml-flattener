#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../src/key_expander'

class KeyExpanderTest < Minitest::Test
  def test_single_key
    key_expander = KeyExpander.new(hash: { 'one' => 1 })
    assert_equal(
      key_expander.keys_and_values,
      'one' => 1
    )
  end

  def test_unaltered_nested_key
    key_expander = KeyExpander.new(hash: { 'test' => { 'one' => 1 } })
    assert_equal(
      key_expander.keys_and_values,
      'test' =>  { 'one' => 1 }
    )
  end

  # def test_nested_key_expansion
  #   key_expander = KeyExpander.new(hash: { 'test.one' => 1 })
  #   assert_equal(
  #     key_expander.keys_and_values,
  #     'test' =>  { 'one' => 1 }
  #   )
  # end
end
