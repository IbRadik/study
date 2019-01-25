module IbRadik
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        country_counter = 0
        rating_kinopoisk_counter = 0

        for i in _array do
          if i["rating_kinopoisk"].to_f.positive? and i["country"].to_s.count(',') > 0
            country_counter = country_counter + 1
            rating_kinopoisk_counter = rating_kinopoisk_counter + i["rating_kinopoisk"].to_f
          end
        end

        return rating_kinopoisk_counter / country_counter

      end

      def chars_count(_films, _threshold)
        elem = 'и'
        # count_i = 0

        # for film in _films do
        #   if film['rating_kinopoisk'] != '' && !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= _threshold
        #       if film['name'].include?(elem)
        #         count_i = count_i + 1
        #       end
        #   end
        # end

        # films_needs_rate = _films.select { |film| film['rating_kinopoisk'].to_f >= _threshold }
        # needs_films = films_needs_rate.each { |film| film['name']}.reduce(0){ |x, film| x + film['name'].count(elem)}
        # puts needs_films
        #
        #
        # films_needs_rate = _films.select { |film| film['rating_kinopoisk'].to_f >= _threshold }
        # needs_films = films_needs_rate.each { |film| film['name']}.
        #     reduce(0){ |sum, film| film['name'].include?(elem) ? sum + 1 : sum }

        # sum = 0
        # var = _films.select { |film| film['rating_kinopoisk'].to_f >= _threshold && film['name'].include?(elem) }
        # var.length

        _films.count{ |film| film['rating_kinopoisk'].to_f >= _threshold && film['name'].include?(elem) }

      end
    end
  end
end
