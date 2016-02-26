require 'pathname'
require_relative 'src/yaml_flat'

file = Pathname.new(ARGV[0]).read

YmlFlat.new(file).to_file
