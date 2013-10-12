require 'open-uri'

class ScrawController < ApplicationController
  def scrawl
   Scraw.destroy_all
   ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='scraws';")
   tr = []
   doc = Nokogiri::XML(open('http://aggregate.movie.daum.net/provider/rss/futureshow.xml'))
   ActiveRecord::Base.transaction do
   doc.xpath('//item').each do |item|
      title = item.xpath('./title').text
      link = item.xpath('./link').text
      description = item.xpath('./description').text
      content = Nokogiri::HTML(open(link))
      poster = content.xpath('//p[@class="poster"]/a/img').attribute('src').text
      Scraw.create(title:title, link:link, description:description, poster:poster)
    end
   end
  end
end
