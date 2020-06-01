LOWER_A = 'a'.ord
LOWER_Z = 'z'.ord
UPPER_A = 'A'.ord
LETTERS = 26

def caeser_cipher(string, shift)
  return string.split("").map { |c| shift(c, shift) }.join("")
end

def shift(char, shift)
  if !isLetter?(char)
    return char
  elsif isLowerCase?(char)
    return shiftLetter(char, shift, LOWER_A)
  else
    return shiftLetter(char, shift, UPPER_A)
  end
end

def shiftLetter(char, shift, start)
  char_in_0_base = char.ord + shift - start
  char_in_0_26_base = char_in_0_base % LETTERS
  char_in_a_z_base = char_in_0_26_base + start
  return char_in_a_z_base.chr
end

def isLetter?(char)
  return (UPPER_A..LOWER_Z).include?(char.ord)
end

def isLowerCase?(char)
  return (LOWER_A..LOWER_Z).include?(char.ord)
end