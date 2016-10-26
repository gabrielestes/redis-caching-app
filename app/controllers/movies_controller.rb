class MoviesController < ApplicationController
  def index
    @movie = Movie.new(title: params[:title])
  end

  def show
    @movie = Movie.new(title: params[:title])
    # if @movie.save
      create_url_path
      get_parsed_url
      set_movie_values
    # else
      # redirect_to root_path
    # end
  end

  private

  def create_url_path
    @movie_url = "http://netflixroulette.net/api/api.php?title=#{@movie[:title]}"
  end

  def get_parsed_url
    @query = HTTParty.get(@movie_url).parsed_response
    # @poster =
  end

  def cache_key
    File.open("cache.json","w") do |f|
      f.write(JSON.pretty_generate(@movie_data))
    end
  end

  def set_movie_values
    @movie.title = @query["show_title"]
    @movie.release_date = @movie["release_year"]
    @movie.genre = @movie["category"]
    @movie.cast = @movie["show_cast"]
    @movie.summary = @movie["summary"]
    @movie.poster = @movie["poster"]
    @movie.runtime = @movie["runtime"]
  end
  def perform_redis_cache
  end

  def cache_find
    file = File.read('cache.json')
    cache = JSON.parse(file)
  end
end
