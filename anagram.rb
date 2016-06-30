#Anagrams
def anagrams(string)
  # Init dictionary
  dictionary = {}
  File.readlines("enable.txt").each do |line|
    dictionary[line.chomp] = true
  end
  # Convert string to array of char, so we can use array's powerful methods
  arr = string.split("")
  # Get all permutations of the string
  arr = arr.permutation(arr.size).to_a.map { |item| item.join }
  # Select only valid words
  arr.select! { |item| dictionary[item] == true }
  # Remove the string provided
  arr - [string]
  arr.uniq.sort
end