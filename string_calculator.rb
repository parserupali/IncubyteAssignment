class StringCalculator
  def add(input)
    return 0 if input.strip.empty?
    return 0 unless input =~ /\d/
    return 0 unless input.match?(/\A[^a-zA-Z]*\z/)
    return (input.match?(/\A\d+\z/) ? input.to_i : nil) if input.length == 1

    extract_valid_operands(input).sum
  end

  def extract_valid_operands(input)
    numbers = input
    delimiters = ["\n", "\,"]

    delimiters, numbers = extract_custom_delimiters(input) if input.start_with?("//")

    operands = operands(numbers, Regexp.union(delimiters))

    filter_negatives_and_large_numbers(operands)
  end

  def operands(numbers, delimiters_regex)
    numbers.split(delimiters_regex).map(&:to_i)
  end

  def filter_negatives_and_large_numbers(operands)
    negatives = operands.select(&:negative?)
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    operands.reject { |n| n > 1000 }
  end

  def extract_custom_delimiters(input)
    delimiter_part, numbers = input.split("\n", 2)

    delimiters = (delimiter_part.include?('[') && delimiter_part.include?(']')) ?
                   delimiter_part.scan(/\[(.+?)\]/).flatten : delimiter_part[/\/\/(.*)/, 1]
    [delimiters, numbers]
  end
end
