# Write a method anagrams which takes in a string and an array of words (the "dictionary") returns an array of anagrams that can be made with the specified string. Assume the input is only a single word (e.g. "loot" not "William Shakespeare").

def anagrams(word, dictionary)

  matched = []

  # sort the word to match in alpahetical order
  cleaned_word = word.chars.sort.join

  # For each item in the dictionary providd, check if the word is an anagram
  dictionary.each do | matcher|
    sorted_word = matcher.chars.sort.join

    if(cleaned_word == sorted_word)
      matched << matcher.upcase
    end
  end
  matched
end