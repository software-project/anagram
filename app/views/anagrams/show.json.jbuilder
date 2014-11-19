@anagrams.each do |anagram, values|
  json.set! anagram do
    json.array! values
  end
end