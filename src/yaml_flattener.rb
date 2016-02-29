# Takes a file as argument, reads it and returns a converted yml file.
class YamlFlattener
  attr_reader :hash, :file_basename

  def initialize(file_name)
    @file_basename = File.basename(file_name, '.yml')
    @hash = YAML.load(File.read(file_name))
  end

  def flat_hash
    flattened_key_maps = hash.keys.map do |key|
      KeyFlattener.new(hash: hash, current_key: key).key_value_pair
    end
    flattened_key_maps.reduce(:merge)
  end

  def flat_file_string
    YAML.dump(flat_hash)
  end

  def to_file
    File.open("#{file_basename}_flat.yml", 'w') do |file|
      file.write(flat_file_string)
    end
  end
end
