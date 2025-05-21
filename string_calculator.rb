class StringCalculator
  def add(input)
    return 0 if input.strip.empty?
    return nil unless input =~ /\d/
    return nil unless input.match?(/\A[^a-zA-Z]*\z/)
    return (input.match?(/\A\d+\z/) ? input.to_i : nil) if input.length == 1

    select_operands_from_input(input).sum
  end

  def select_operands_from_input(input)
    numbers = input
    delimiters = ["\n", "\,"]

    delimiters, numbers = specific_delimeters(input) if input.start_with?("//")

    operands = operands(numbers, Regexp.union(delimiters))

    reject_invalid_operand(operands)
  end

  def operands(numbers, delimiters_regex)
    numbers.split(delimiters_regex).map(&:to_i)
  end

  def reject_invalid_operand(operands)
    negatives = operands.select(&:negative?)
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    operands.reject { |n| n > 1000 }
  end

  def specific_delimeters(input)
    delimiter_part, numbers = input.split("\n", 2)

    delimiters = (delimiter_part.include?('[') && delimiter_part.include?(']')) ?
                   delimiter_part.scan(/\[(.+?)\]/).flatten : delimiter_part[/\/\/(.*)/, 1]
    return delimiters, numbers
  end
end
