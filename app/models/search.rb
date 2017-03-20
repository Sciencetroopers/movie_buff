class Search < ApplicationRecord
  def search_movies
    movies = Movie.all

    movies = movies.where(["title LIKE ?", "%#{keywords}%"]) if keywords.present?
    movies = movies.where(["genre LIKE ?", genre]) if genre.present?
    movies = movies.where('year > ? AND year < ?', min_year, Movie.maximum("year")) if min_year.present?
    movies = movies.where('year > ? AND year < ?', Movie.minimum("year"), max_year) if max_year.present?
    movies = movies.where('year > ? AND year < ?', min_year, max_year) if (min_year && max_year).present?

    movies = movies.where(["director LIKE ?", "%#{director}%"]) if director.present?
    movies = movies.where(["actors LIKE ?", "%#{actor}%"]) if actor.present?

    return movies
  end
end
