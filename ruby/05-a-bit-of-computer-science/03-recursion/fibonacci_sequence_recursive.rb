def fibonacci_sequence_recursive(n)
  sequence = []
  0.upto(n) do |i|
    sequence << fibonacci(i)
  end
  sequence
end

def fibonacci(n)
  if n == 0 || n == 1
    return n
  end
  fibonacci(n - 1) + fibonacci(n - 2)
end