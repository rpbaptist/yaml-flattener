#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'

require 'minitest/autorun'

require_relative '../src/key_flattener'

class KeyFlattenerTest < Minitest::Test
  def test_value_found?
    key_flattener = KeyFlattener.new({ 'one' => 1 } , 'one')
    assert_equal(
      key_flattener.value_found?,
      true
    )
  end

  def test_simple_key_value_pair
    key_flattener = KeyFlattener.new({ 'one' => 1 } , 'one')
    assert_equal(
      key_flattener.key_value_pair,
      { 'one' => 1 }
    )
  end

  def test_previous_key_value_pair
    key_flattener = KeyFlattener.new({ 'one' => 1 } , 'one', 'simple')
    assert_equal(
      key_flattener.key_value_pair,
      { 'simple.one' => 1 }
    )
  end

  def test_single_key_value_pair
    starting_hash = { 'simple' => { 'one' => 1 } }
    key_flattener = KeyFlattener.new(starting_hash, 'simple')
    assert_equal(
      key_flattener.key_value_pair,
      { 'simple.one' => 1 }
    )
  end

  def test_multiple_key_value_pairs
    starting_hash = { 'simple' => { 'one' => 1, 'two' => 2 } }
    key_flattener = KeyFlattener.new(starting_hash, 'simple')
    assert_equal(
      key_flattener.key_value_pair,
      { 'simple.one' => 1, 'simple.two' => 2 }
    )
  end
end
