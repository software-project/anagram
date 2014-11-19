class DictionaryImporter

  def self.import file_path
    File.open(file_path, "r") do |file|
      while line = file.gets
        new_word = line.strip
        # Sorts letters to get a key
        key = new_word.chars.sort.join
        current_words = $redis.get key
        # if key exists, adds strings
        unless current_words.blank?
          $redis.set key, (current_words.split(',') + [new_word]).uniq.join(',')
        else
          $redis.set key, new_word
        end
      end
    end
  end
end