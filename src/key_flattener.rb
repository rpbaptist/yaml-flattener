class KeyFlattener
  attr_reader :result, :current_key, :previous_key

  def initialize(hash, current_key, previous_key = nil)
    @result = hash[current_key]
    @current_key = current_key
    @previous_key = previous_key
  end

  def found_value?
    !result.is_a?(Hash)
  end
end
