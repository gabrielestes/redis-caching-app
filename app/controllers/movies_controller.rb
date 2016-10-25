class MoviesController < ApplicationController
  def index
    title = ('attack on titan').gsub(/\s/, '%20')
    create_url_path(title)
    get_parsed_url
  end

  def show
  end

  private

  def create_url_path(title)
    @movie_url = "http://netflixroulette.net/api/api.php?title=#{title}"
  end

  def get_parsed_url
    @movie_data = HTTParty.get(@movie_url).parsed_response
  end

  def cache_key
    File.open("cache.json","w") do |f|
      f.write(JSON.pretty_generate(@movie_data))
    end
  end

  def perform_redis_cache
  end

  def cache_find
    file = File.read('cache.json')
    cache = JSON.parse(file)
  end
end
