require "minitest/autorun"
require_relative "string_calculator"

class StringCalculatorTest < Minitest::Test
  #{TC1 => TC1..TC5}
  def test_handle_blank_string_imput
    calc = StringCalculator.new
    result = calc.add("")
    assert_equal 0, result
  end
end