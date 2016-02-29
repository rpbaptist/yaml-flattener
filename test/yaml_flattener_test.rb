#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'

require 'pry'
require 'minitest/autorun'

require_relative '../src/yaml_flattener'

class YamlFlattenerTest < Minitest::Test
  def simple_yaml_flattener
    file = File.expand_path('../files/simple.yml', __FILE__)
    YamlFlattener.new(file)
  end

  def multiple_yaml_flattener
    file = File.expand_path('../files/multiple.yml', __FILE__)
    YamlFlattener.new(file)
  end

  def test_yaml_hash
    assert_equal(
      simple_yaml_flattener.yaml_hash,
      'simple' => { 'one' => 1, 'two' => 2 }
    )
  end

  def test_simple_flat_yaml_hash
    assert_equal(
      simple_yaml_flattener.flat_yaml_hash,
      'simple.one' => 1, 'simple.two' => 2
    )
  end

  def test_multiple_flat_yaml_hash
    assert_equal(
      multiple_yaml_flattener.flat_yaml_hash,
      'one.a' => 1, 'one.b' => 2, 'two.a' => 3, 'two.b' => 4
    )
  end

  def test_flat_file
    skip
  end
end
