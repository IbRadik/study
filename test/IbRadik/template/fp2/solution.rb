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
      def my_reduce(acc = nil)

        if acc.nil?
          acc = self[0]
          self.slice(1, self.length - 1).my_each {|x| acc = yield(acc, x)}
        else
          self.my_each {|x| acc = yield(acc, x)}
        end

        # for i in self do
        #   if acc.nil?
        #     acc = self[0]
        #     next
        #   end
        #   acc = yield(acc, i)
        # end
        #
        #
         # my_each do |elem|
         #   if acc.nil?
         #     acc = self[0]
         #     next
         #   end
         #   acc = yield(acc,elem)
         # end
         acc
      end
    end
  end
end
