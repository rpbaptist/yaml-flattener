require 'yaml'

require_relative 'key_flattener'

# Takes a file as argument, reads it and returns a converted yml file.
class YamlFlattener
  attr_reader :hash

  def initialize(file)
    yaml_string = File.read(file)
    @hash = YAML.load(yaml_string)
  end

  def flat_hash
    flattened_key_maps = hash.keys.map do |key|
      KeyFlattener.new(hash: hash, current_key: key).key_value_pair
    end
    flattened_key_maps.reduce(:merge)
  end

  def flat_file
    YAML.dump(flat_hash)
  end
end
