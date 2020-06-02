# Returns a hash listing each substring that was found in `string` and how many times it was found in `dictionary`.
# Params:
# +string+:: The original String
# +dictionary+:: Contains valid substrings, all downcased
def substrings(string, dictionary)
  hash = Hash.new(0)
  string.split(" ")
        .map { |sub| get_all_unique_substrings(sub.downcase) }
        .flatten
        .each { |sub| hash[sub] += 1 if dictionary.include? sub }
  return hash
end

# Return all unique substrings from `string`
def get_all_unique_substrings(string)
  indices = (0..string.length).to_a
  indices.product(indices)
          .reject { |i, j| i > j }
          .map { |i, j| string[i..j] }
          .uniq
end