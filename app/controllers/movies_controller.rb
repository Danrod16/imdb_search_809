class MoviesController < ApplicationController

  def index
    if params[:query].present?
      # Active record way

      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.synopsis @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # pg search way

      # @movies = Movie.search_by_title_and_synopsis(params[:query])

      # pg multisearchable way

      @results = PgSearch.multisearch('superman')

    else
      @results = PgSearch.multisearch('')
    end
  end
end
