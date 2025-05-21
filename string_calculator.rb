class StringCalculator
  def add(input)
    return 0 if input.strip.empty?

    input.to_i if input.length == 1 && input.match?(/\A\d+\z/)
  end
end
