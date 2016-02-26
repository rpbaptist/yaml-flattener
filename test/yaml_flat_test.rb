#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'

require 'pathname'
require 'pry'
require 'minitest/autorun'

require_relative '../src/yaml_flat'

class YamlFlatTest < Minitest::Test
  def simple_yaml_file
    File.expand_path('../simple.yml', __FILE__)
  end

  def yaml_flat
    YamlFlat.new(simple_yaml_file)
  end

  def test_yaml_hash
    assert_equal yaml_flat.yaml_hash, 'simple' => {
      'one' => 1,
      'two' => 2
    }
  end

  def test_flat_file
    skip
    assert_equal yaml_flat.flat_yaml_hash, {
      'simple.one' => 1,
      'simple.two' => 2
    }
  end
end
