# frozen_string_literal: true

require 'launchy'

class WebsiteGenerator
  VALID_WEBSITES = %w[github google amazon youtube]

  def initialize(name, query)
    @name = name
    validate_name
    @query = query
    validate_query
  end

  def url
    send @name
  end

  def open
    Launchy.open(url)
  end

  private

  YOUTUBE_URL = 'https://www.youtube.com/results?search_query='
  GITHUB_URL = 'https://github.com/search?q='
  GOOGLE_URL = 'https://www.google.com/search?q='
  AMAZON_URL = 'https://www.amazon.fr/s?k='

  def youtube
    YOUTUBE_URL + query_builder
  end

  def github
    GITHUB_URL + query_builder
  end

  def google
    GOOGLE_URL + query_builder
  end

  def amazon
    AMAZON_URL + query_builder
  end

  def query_builder
    return 'boxe+francaise' if @query == 'boxe francaise'
    return 'counter+strike' if @query == 'counter strike'
  end

  def validate_name
    return if VALID_WEBSITES.include? @name

    raise StandardError, 'invalid website'
  end

  def validate_query
    return if query_builder.is_a? String

    raise StandardError, 'Cela ne fait pas partie des recherches autorisées'
  end
end
