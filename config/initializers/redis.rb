require 'dictionary_importer'

if ENV["REDISCLOUD_URL"]
  $redis = Redis.new(:url => ENV["REDISCLOUD_URL"])
else
  $redis = Redis.new(:host => 'localhost', :port => 6379)
  DictionaryImporter.import('config/words.txt') if Rails.env.development?
end
