def fizzBuzz
  puts "Enter a number"
  number = gets.chomp.to_i

  1.upto(number) do |i|
    if i % 15 == 0
      puts "FizzBuzz"
    elsif i % 5 == 0
      puts "Buzz"
    elsif i % 3 == 0
      puts "Fizz"
    else
      puts i
    end
  end
end