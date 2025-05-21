require "minitest/autorun"
require_relative "string_calculator"

class StringCalculatorTest < Minitest::Test
  #{TC1 => TC1-1..TC1-5}
  def test_handle_blank_string_imput
    calc = StringCalculator.new
    result = calc.add("")
    assert_equal 0, result
  end

   #{TC2 => TC2-1..TC2-5}
  def test_handle_single_digit_string_imput
    calc = StringCalculator.new
    result = calc.add("1")
    assert_equal 1, result
  end

  def test_handle_single_character_string_imput
    calc = StringCalculator.new
    result = calc.add(",")
    assert_equal nil, result
  end

  def test_handle_no_alphabet_character_string_imput
    calc = StringCalculator.new
    result = calc.add("A")
    assert_equal nil, result
  end


end