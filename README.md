Implemented String Calculator using TDD approach

1. Developed the StringCalculator class using a Test-Driven Development (TDD) methodology.
2. Screenshots are provided for each implementation step and are stored in the screenshots folder.
3. The first three test cases were committed together along with their corresponding code changes.
   Although they were grouped in a single commit, individual screenshots for each step are available for reference.
4. Subsequent test cases were committed sequentially with meaningful commit messages such as "Failing test case" and "Passing test case"
   to reflect progress through the TDD cycle.
5. Manual Testing Covered the Following Scenarios:

puts StringCalculator.new.add("")                            # => 0
puts StringCalculator.new.add("1")                           # => 1
puts StringCalculator.new.add("1,2")                         # => 3
puts StringCalculator.new.add("1,2,3")                       # => 6

puts StringCalculator.new.add("\n")                          # => 0
puts StringCalculator.new.add("1\n")                         # => 1
puts StringCalculator.new.add("1\n2")                        # => 3
puts StringCalculator.new.add("1\n2,3")                      # => 6

puts StringCalculator.new.add("//;")                         # => 0
puts StringCalculator.new.add("//;\n")                       # => 0
puts StringCalculator.new.add("//;\n1")                      # => 1
puts StringCalculator.new.add("//;\n1;2")                    # => 3
puts StringCalculator.new.add("//;;\n1;;2;;3")               # => 6
puts StringCalculator.new.add("//**\n")                      # => 0
puts StringCalculator.new.add("//**\n1**2**3")               # => 6

puts StringCalculator.new.add("//[***]")                     # => 0
puts StringCalculator.new.add("//[***]\n")                   # => 0
puts StringCalculator.new.add("//[***]\n1")                  # => 1
puts StringCalculator.new.add("//[***]\n1***2***3")          # => 6
puts StringCalculator.new.add("//[*][%]\n1*2%3")             # => 6
puts StringCalculator.new.add("//[**][%%]\n1**2%%3")         # => 6
puts StringCalculator.new.add("2,1001")                      # => 2
puts StringCalculator.new.add("1,-2,-3")                     # => raises "negative numbers not allowed -2, -3"