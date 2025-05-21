require "minitest/autorun"
require_relative "string_calculator"

class StringCalculatorTest < Minitest::Test

  def setup
    @calc = StringCalculator.new
  end

  #{TC1 => TC1-1..TC1-5}
  def test_handle_blank_string_input
    assert_equal 0, @calc.add("")
  end

   #{TC2 => TC2-1..TC2-5}
  def test_handle_single_digit_string_input
    assert_equal 1, @calc.add("1")
  end

  def test_handle_single_character_string_input
    assert_nil @calc.add(",")
  end

  def test_handle_no_alphabet_character_string_input
    assert_nil @calc.add("A")
  end

   #{TC3 => TC3-1..TC3-6}
  def test_handle_more_than_one_digit_string_input_by_comma
    assert_equal 3, @calc.add("1,2")
  end

  def test_handle_more_than_one_character_string_input_by_comma
    assert_nil @calc.add("A,B")
  end

  #{TC4 => TC4-1..TC4-3}
  def test_handle_new_line_as_a_delimiter
    assert_equal 3, @calc.add("1\n2")
  end

  def test_handle_new_line_as_a_delimiter_with_comma
    assert_equal 6, @calc.add("1\n2,3")
  end

  #{TC5 => TC5-1..TC5-2}
  def test_handle_digits_addition_with_specified_delimiter
    assert_equal 3, @calc.add("//;\n1;2")
  end

  #{TC6 => TC6-1}
  def test_handle_negative_digits
    error = assert_raises(RuntimeError) { @calc.add("1,-2,3") }
    assert_equal "Negative numbers not allowed: -2", error.message
  end

  #{TC7 => TC7-1}
  def test_ignore_number_bigger_than_1000
    assert_equal 1, @calc.add("1001, 1")
  end

  #{TC8 => TC8-1}
  def test_handle_any_length_of_delimiter
    assert_equal 6, @calc.add("//[***]\n1***2***3")
  end

  #{TC9 => TC9-1}
  def test_handle_any_length_of_multiple_delimiter
    assert_equal 6, @calc.add("//[*][%]\n1*2%3")
  end

  def test_handle_if_input_dont_have_digits
    assert_nil @calc.add("//[*][%]\n")
  end
end