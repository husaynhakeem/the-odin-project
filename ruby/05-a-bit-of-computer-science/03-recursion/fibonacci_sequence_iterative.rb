def fibonacci_sequence_iterative(n)
  sequence = []
  0.upto(n) do |i|
    sequence << fibonacci(i)
  end
  sequence
end

def fibonacci(n)
  fib = [0, 1]
  2.upto(n) do |i|
    fib << fib[i - 1] + fib[i - 2]
  end
  fib[n]
end
