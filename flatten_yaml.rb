require 'yaml'

require_relative 'src/key_flattener'
require_relative 'src/yaml_flattener'

# Usage: call ruby flatten_yaml <file_name>
YamlFlattener.new(ARGV[0]).to_file
