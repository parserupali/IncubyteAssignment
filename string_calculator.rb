class StringCalculator
  def add(input)
    return 0 if input.strip.empty?
    return nil unless input.match?(/\A[^a-zA-Z]*\z/)

    if input.length == 1
      return input.match?(/\A\d+\z/) ? input.to_i : nil
    end

    numbers_part = input
    delimiter = ["\n", "\,"]

    if input.start_with?("//")
      delimiter_part, numbers_part = input.split("\n", 2)
      delimiter = delimiter_part[/\/\/(.*)/, 1]
    end

    operands = operands(numbers_part, Regexp.union(delimiter))
    operands.sum
  end

  def operands(numbers_part, delimiters_regex)
    numbers_part.split(delimiters_regex).map(&:to_i)
  end
end
