module IbRadik
  module Arrays
    class << self

      def replace(array)
        list_1 = []
        # for i in array do
        #   if i >= 0
        #     list_1.append(array.max)
        #   else
        #     list_1.append(i)
        #   end
        # end

        list = array.map { |x| x >= 0 ? array.max : x }
        return list
      end

      def search(_array, _query)
        first = 0
        last = _array.length - 1
        found = false

        while first <= last and not found
          midpoint = (first + last) / 2
          if _array[midpoint] == _query
            found = true
          else
            if _query < _array[midpoint]
              last = midpoint - 1
            else
              first = midpoint + 1
            end
          end
        end

        if found == true
          return midpoint
        else
          return -1
        end
      end

    end
  end
end


# new_array = Template::Arrays
#
# print new_array.replace([3, 2, -8, 4, 100, -6, 7, 8, -99])
# puts ' '
# print new_array.search([1, 4, 5, 7, 8, 9], 99)