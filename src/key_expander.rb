# Takes a hash with namespaced keys and expands it to nested key value pairs.
class KeyExpander
  attr_reader :hash, :nested_value

  def initialize(hash:, nested_value: nil)
    @hash = hash
    @nested_value = nested_value
  end

  def keys_and_values
    hash.map do |key, _value|
      keys = key.split('.')
      last_key = keys.pop
      current_value = nested_value || hash[last_key]
      if keys.count == 0
        { last_key => current_value }
      else
        new_hash = { keys.join('.') => { last_key => current_value } }
        KeyExpander.new(hash: new_hash, nested_value: current_value).keys_and_values
      end
    end.reduce(:merge)
  end
end

