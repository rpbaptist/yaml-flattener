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
    flattened_key_maps = yaml_hash.keys.map do |key|
      KeyFlattener.new(hash: yaml_hash, current_key: key).key_value_pair
    end
    flattened_key_maps.reduce(:merge)
  end
end
