class StringCalculator
  def add(input)
    return 0 if input.strip.empty?
    return nil unless input.match?(/\A[^a-zA-Z]*\z/)

    if input.length == 1
      return input.match?(/\A\d+\z/) ? input.to_i : nil
    end

    operands = input.split(',').map(&:to_i)
    operands.sum
  end
end
