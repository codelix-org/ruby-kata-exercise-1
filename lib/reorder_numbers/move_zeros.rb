module ReorderNumbers
  class MoveZeros
    class InvalidInput < StandardError; end

    def self.call(numbers)
      validate_input(numbers)
      numbers.partition { |number| number == 0 }.reverse.flatten
    end

    private

    def self.validate_input(input)
      raise InvalidInput unless input.is_a?(Array)

      non_numeric_values = input.select {|item| !item.is_a?(Numeric) }
      raise InvalidInput if non_numeric_values.count > 0
    end
  end
end
