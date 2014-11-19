class AnagramFinder < UserRole

  def find(anagrams)
    results = {}
    if anagrams.present?
      anagrams.split(',').each do |anagram|
        result = $redis.get(anagram.chars.sort.join)
        if result.present?
          results[anagram] = result.split(',')
        else
          results[anagram] = []
        end
      end
    end
    results
  end

end