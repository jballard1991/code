require 'net/http'
Net::HTTP.start('boards.4chan.org',80) do |http|
print(http.get('/b/').body)
end

