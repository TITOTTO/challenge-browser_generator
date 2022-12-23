# frozen_string_literal: true

require_relative '../lib/website_generator'

class SearchScript
  def initialize
    welcome
    ask_site
    ask_query
    ask_confirmation
    open_browser
  end

  private

  def welcome
    p 'Welcome in our program'
    p 'This amazing tool can search the web for you safely'
    p 'Please tell us which site you choose'
  end

  def ask_confirmation
    p website_url
    p 'Do you confirm the search ?'
    confirmation = gets.chomp
    confirmation_input = true if confirmation == 'y'

    return if confirmation_input

    error(message: 'You did not confirm search')
  end

  def open_browser
    website_generator.open
  end

  def website_url
    website_generator.url
  end

  def website_generator
    @website_generator ||= WebsiteGenerator.new(@site_input, @query_input)
  end

  def ask_site
    @site_input = gets.chomp

    validate_site_input(@site_input)
  end

  def ask_query
    p 'Which search you wanna do ?'
    @query_input = gets.chomp

    validate_query_input(@query_input)
  end

  def validate_query_input(input)
    return true if input.length < 50

    error(message: 'La recherche ne trouve rien')
  end

  def validate_site_input(input)
    return true if %w[youtube amazon github google].include?(input)
    #WebsiteGenerator.VALID_WEBSITES (Je n'ai pas réussi à le faire fonctionner)

    error(message: 'Cela ne fait pas partie des choix disponibles')
  end

  def error(message: '')
    raise StandardError, "Oups, something happened: #{message}"
  end
end

SearchScript.new
