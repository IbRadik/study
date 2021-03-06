module Mkalmykov
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        required_films = array.select do |film|
          !film['country'].nil? && film['country'].split(',').length >= 2 && !film['rating_kinopoisk'].to_f.zero?
        end

        summed_rating = required_films.map { |film| film['rating_kinopoisk'].to_f }
                                      .reduce(:+)
        summed_rating / required_films.length
      end

      def chars_count(films, threshold)
        letter_to_count = 'и'

        threshold = threshold.to_f
        films.reduce(0) do |accum, film|
          film['rating_kinopoisk'].to_f >= threshold ? accum + film['name'].scan(/#{letter_to_count}/i).length : accum
        end
      end
    end
  end
end
