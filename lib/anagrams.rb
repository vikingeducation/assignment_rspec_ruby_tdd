require 'pry'
# Write a method anagrams which takes in a string and an array of
# words (the "dictionary") returns an array of anagrams that can be
# made with the specified string. Assume the input is only a single
# word (e.g. "loot" not "William Shakespeare").

def anagrams(input_word, dictionary)
  raise ArgumentError if !input_word.is_a?(String) || !dictionary.is_a?(Array)
  input_word.strip!

  raise ArgumentError if input_word.length != input_word.gsub(/ /, '').length

  processed_input = process(input_word)
  matches = []

  dictionary.each do |entry|
    matches << entry if process(entry) == processed_input
  end

  if matches.length > 0
    matches
  else
    render_no_match_notification(input_word)
  end
end

def process(word)
  word = word.downcase.chars.sort.join('')
end

def render_no_match_notification(input_word)
  puts "Sorry, there are no anagrams for '#{input_word}'."
end
