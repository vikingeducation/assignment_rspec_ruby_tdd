def anagrams(keyword, dict=false)
  keyword.upcase!
  dictionary = (dict || File.foreach("enable.txt").map {|word| word.strip}).map!{|word| word.upcase}
  sorted = keyword.split("").sort.join
  dictionary.select {|anagram| sorted == anagram.split("").sort.join && anagram != keyword}
end