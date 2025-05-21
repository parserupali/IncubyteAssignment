class StringCalculator
  def add(input)
    return 0 if input.strip.empty?
    return nil unless input.match?(/\A[^a-zA-Z]*\z/)

    if input.length == 1
      return input.match?(/\A\d+\z/) ? input.to_i : nil
    end

    delimiters_regex = /[\n,]/

    if input.start_with?("//")
      delimiter_part, numbers_part = input.split("\n", 2)
      delimiter = delimiter_part[/\/\/(.*)/, 1]
      delimiters_regex = Regexp.union(delimiter)
    end

    operands = input.split(delimiters_regex).map(&:to_i)
    operands.sum
  end
end
