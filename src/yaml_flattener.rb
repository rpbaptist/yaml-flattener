require 'yaml'
require 'pry'

require_relative 'key_flattener'

# Takes a file as argument, reads it and returns a converted yml file.
class YamlFlattener
  attr_reader :yaml_hash

  def initialize(file)
    yaml_string = File.read(file)
    @yaml_hash = YAML.load(yaml_string)
  end

  def flat_yaml_hash
    yaml_hash.map do |key, value|
      KeyFlattener.new(value, key).key_value_pair
    end.reduce(:merge)
  end
end