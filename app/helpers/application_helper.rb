require 'nokogiri'
require 'open-uri'
require 'octokit'

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
      link = item.css('h1 a')[0]['href'][1..-1] # 项目链接
      language = item.search('span[itemprop="programmingLanguage"]').text
      desc = item.css('.col-9.text-gray.my-1.pr-4').text.strip
      stars = item.css('.muted-link.d-inline-block.mr-3');
      star_count = stars[0].children[-1].text.gsub(',', '').match(/[\d]+/).to_s
      fork_count = stars[1].children[-1].text.match(/[\d]+/).to_s
      star_today = item.css('.d-inline-block.float-sm-right').children[-1].text.match(/[\d]+/).to_s
      repo_color = item.at_css('.repo-language-color')
      repo_color = repo_color ? repo_color['style'] : nil
      collection << {
        link: link,
        language: language,
        star_count: star_count,
        star_today: star_today,
        fork_count: fork_count,
        repo_color: repo_color,
        desc: desc
      }
    end
    if defined?(ReadCache.redis) && !ReadCache.redis.get(redisPath)
      ReadCache.redis.set(redisPath, collection);
    end
    collection
  end

  def getClient
    @github_client ||= Octokit::Client.new(:access_token => current_user.access_token)
  end

  def getUser
    @github_user ||= getClient().user
  end

  def getStar(page = 1)
    @github_star ||= getClient().get("/user/starred?page=#{page}")
    @github_star_link = parseLink(getClient().last_response.headers[:link])
    @github_star_link.each do |key,val|
      @github_star_link[key] = val[/page=(\d+)/, 1]
    end
  end

  def parseLink(link)
    links = Hash.new
    parts = link.split(',')
    parts.each do |part, index|
      section = part.split(';')
      url = section[0][/<(.*)>/,1]
      name = section[1][/rel="(.*)"/,1].to_sym
      links[name] = url
    end
    return links
  end

end
