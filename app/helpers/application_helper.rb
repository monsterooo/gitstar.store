require 'nokogiri'
require 'open-uri'

module ApplicationHelper
  def trending(lang)
    currentDate = DateTime.now.to_date.to_s
    redisPath = "#{currentDate}-#{lang}"
    collection = []

    if defined?(ReadCache.redis) && ReadCache.redis.get(redisPath)
      return eval(ReadCache.redis.get(redisPath))
    end
    doc = Nokogiri::HTML(open("https://github.com/trending/#{lang}?since=daily"))
    doc.css('.Box-row').each do |item|
      link = item.css('h1 a')[0]['href'] # 项目链接
      name = link.split('/')[-1]; # 项目名称
      desc = item.css('.col-9.text-gray.my-1.pr-4').text
      # p desc # \n 没有清除不过在网页解析中并无大碍
      collection << {
        link: link,
        name: name,
        desc: desc
      }
    end
    if defined?(ReadCache.redis) && !ReadCache.redis.get(redisPath)
      ReadCache.redis.set(redisPath, collection);
    end
    collection
  end
end
