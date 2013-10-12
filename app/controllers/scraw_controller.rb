require 'open-uri'

class ScrawController < ApplicationController
  def scrawl
   Scraw.destroy_all
   #url = 'http://aggregate.movie.daum.net/provider/rss/futureshow.xml'
   doc = Nokogiri::XML(open('http://aggregate.movie.daum.net/provider/rss/futureshow.xml'))
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
