class KeyFlattener
  attr_reader :result, :current_key, :previous_key

  def initialize(hash, current_key, previous_key = nil)
    @result = hash[current_key]
    @current_key = current_key
    @previous_key = previous_key
  end

  def value_found?
    !result.is_a?(Hash)
  end

  def key_value_pair
    return current_pair if value_found?

  end

  def current_pair
    { current_key => result }
  end
end
