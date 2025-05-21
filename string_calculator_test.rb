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
    assert_nil result
  end

  def test_handle_no_alphabet_character_string_imput
    calc = StringCalculator.new
    result = calc.add("A")
    assert_nil result
  end

   #{TC3 => TC3-1..TC3-6}
  def test_handle_more_than_one_digit_string_imput_by_comma
    calc = StringCalculator.new
    result = calc.add("1,2")
    assert_equal 3, result
  end

  def test_handle_more_than_one_character_string_imput_by_comma
    calc = StringCalculator.new
    result = calc.add("A,B")
    assert_nil result
  end

  #{TC4 => TC4-1..TC4-3}
  def test_handle_new_line_as_a_delimiter
    calc = StringCalculator.new
    result = calc.add("1\n2")
    assert_equal 3, result
  end

  def test_handle_new_line_as_a_delimiter_with_comma
    calc = StringCalculator.new
    result = calc.add("1\n2,3")
    assert_equal 6, result
  end

  #{TC5 => TC5-1..TC5-2}
  def test_handle_digits_addition_with_specified_delimiter
    calc = StringCalculator.new
    result = calc.add("//;\n1;2")
    assert_equal 3, result
  end

  #{TC6 => TC6-1}
  def test_handle_negative_digits
    calc = StringCalculator.new
    error = assert_raises(RuntimeError) { calc.add("1,-2,3") }
    assert_equal "Negative numbers not allowed: -2", error.message
  end







end