require 'yaml'
require 'pry'

# Takes a file as argument, reads it and returns a converted yml file.
class YamlFlat
  attr_reader :yaml_hash

  def initialize(file)
    yaml_string = File.read(file)
    @yaml_hash = YAML.load(yaml_string)
  end

=begin
PSEUDO

  Create a new hash for the top level

  Iterate through each key level
  Once the result is not a Hash, we have reached the value

  At this point concatonate all keys to one key (Array.join('.'))
  and set the found value as the value for this key

  Save this in the top level hash as a key value pair.

  Go back one level and try the next, etc.

  Recursion:

  Base case: Not a Hash


=end

