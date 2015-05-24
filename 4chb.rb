#!/usr/bin/ruby
#Returns 4chan's /b/ as a block of text
require 'net/http'
Net::HTTP.start('boards.4chan.org',80) do |http|
print(http.get('/b/').body)
end

