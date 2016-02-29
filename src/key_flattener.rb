#
class KeyFlattener
  attr_reader :result, :current_key, :previous_key

  def initialize(hash:, current_key:, previous_key: nil)
    @result = hash[current_key]
    @current_key = current_key
    @previous_key = previous_key
  end

  def value_found?
    !result.is_a?(Hash)
  end

  def key_value_pair
    return current_pair if value_found?
    flattened_keys = result.keys.map do |next_key|
      KeyFlattener.new(
        hash: result,
        current_key: next_key,
        previous_key: current_key
      ).key_value_pair
    end
    flattened_keys.reduce(:merge)
  end

  def current_pair
    if previous_key
      { "#{previous_key}.#{current_key}" => result }
    else
      { current_key => result }
    end
  end
end
