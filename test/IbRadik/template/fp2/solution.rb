module IbRadik
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in self do
          yield(i)
        end
      end

      # Написать свою функцию my_map
      def my_map
        list = MyArray.new
        for i in self do
          list << yield(i)
        end

        list
      end

      # Написать свою функцию my_compact
      def my_compact
        list = MyArray.new
        self.my_map { |x| !x.nil? ? list.append(x) : next }

        # for i in self do
        #   if !i.nil?
        #     list.append(i)
        #   end
        # end
        list
      end

      # Написать свою функцию my_reduce
      def my_reduce
      end
    end
  end
end
