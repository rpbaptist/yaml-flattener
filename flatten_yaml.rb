require 'pathname'
require_relative 'src/yaml_flattener'

file = Pathname.new(ARGV[0]).read

YmlFlat.new(file).to_file
